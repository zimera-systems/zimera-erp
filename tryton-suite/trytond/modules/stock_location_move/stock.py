# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
import functools

from trytond.i18n import gettext
from trytond.model import ModelSQL, ModelView, Workflow, fields
from trytond.modules.stock.exceptions import AssignError
from trytond.pool import Pool, PoolMeta
from trytond.pyson import Eval, If
from trytond.transaction import Transaction


class Location(metaclass=PoolMeta):
    __name__ = 'stock.location'

    movable = fields.Boolean(
        "Movable",
        states={
            'invisible': Eval('type') != 'storage',
            })
    assigned_by = fields.Reference(
        "Assigned by", 'get_assigned_by', readonly=True)

    @classmethod
    def _get_assigned_by(cls):
        "Return list of Model names for assigned_by Reference"
        return ['stock.shipment.internal', 'stock.shipment.out']

    @classmethod
    def get_assigned_by(cls):
        pool = Pool()
        IrModel = pool.get('ir.model')
        get_name = IrModel.get_name
        models = cls._get_assigned_by()
        return [(None, '')] + [(m, get_name(m)) for m in models]

    @classmethod
    def deactivate_empty(cls, locations=None):
        if locations is None:
            locations = cls.search([
                    ('movable', '=', True),
                    ])
        to_deactivate = cls.get_empty_locations(locations)
        if to_deactivate:
            cls.write(cls.browse(to_deactivate), {'active': False})

    @classmethod
    def forecast_location_move(cls, date):
        """Move temporary locations planned for the date
        and returns a method to restore the initial parent."""
        pool = Pool()
        ShipmentInternal = pool.get('stock.shipment.internal')
        Location = pool.get('stock.location')
        Date = pool.get('ir.date')

        today = Date.today()
        shipments = ShipmentInternal.search([
                ('locations', '!=', None),
                ('state', 'not in', ['cancelled', 'done']),
                ['OR', [
                        ('planned_date', '<=', date),
                        ('planned_date', '>=', today),
                        ('effective_date', '=', None),
                        ], [
                        ('effective_date', '<=', date),
                        ('effective_date', '>=', today),
                        ],
                    ],
                ],
            order=[('planned_date', 'ASC'), ('id', 'ASC')])
        location_parents = {}
        locations = []

        for shipment in shipments:
            for location in shipment.locations:
                location_parents.setdefault(location, location.parent)
                location.parent = shipment.to_location
                locations.append(location)
        Location.save(locations)

        def restore():
            locations = []
            for location, parent in location_parents.items():
                location.parent = parent
                locations.append(location)
            Location.save(locations)
        return restore


def clear_location_assignation(func):
    @functools.wraps(func)
    def wrapper(cls, shipments, *args, **kwargs):
        pool = Pool()
        Location = pool.get('stock.location')
        locations = []
        for shipment in shipments:
            for location in shipment.locations:
                if location.assigned_by == shipment:
                    locations.append(location)
        Location.write(locations, {'assigned_by': None})
        return func(cls, shipments, *args, **kwargs)
    return wrapper


class ShipmentInternal(metaclass=PoolMeta):
    __name__ = 'stock.shipment.internal'

    locations = fields.Many2Many(
        'stock.shipment.internal-location', 'shipment', 'location',
        "Locations",
        domain=[
            ('type', '=', 'storage'),
            ('movable', '=', True),
            If(Eval('state') == 'assigned',
                ('parent', 'child_of', Eval('from_location', -1)),
                ()),
            ],
        states={
            'readonly': (~Eval('state').in_(['request', 'draft'])
                | ~Eval('from_location') | ~Eval('to_location')),
            })

    @classmethod
    @ModelView.button
    @Workflow.transition('draft')
    @clear_location_assignation
    def draft(cls, shipments):
        super(ShipmentInternal, cls).draft(shipments)

    @classmethod
    @ModelView.button
    @Workflow.transition('waiting')
    @clear_location_assignation
    def wait(cls, shipments):
        super(ShipmentInternal, cls).wait(shipments)

    @classmethod
    @Workflow.transition('assigned')
    def assign(cls, shipments):
        pool = Pool()
        Location = pool.get('stock.location')
        locations = {}
        for shipment in shipments:
            for location in shipment.locations:
                if not location.assigned_by:
                    location.assigned_by = shipment
                    if location in locations:
                        raise AssignError(
                            gettext('stock_location_move'
                                '.msg_location_already_assigned') % {
                                'location': location.rec_name,
                                'assigned_by': locations[location].rec_name,
                                })
                    locations[location] = location.assigned_by
                elif location.assigned_by != shipment:
                    raise AssignError(
                        gettext('stock_location_move'
                            '.msg_location_already_assigned') % {
                            'location': location.rec_name,
                            'assigned_by': location.assigned_by.rec_name,
                            })
        if locations:
            Location.save(list(locations))
        super(ShipmentInternal, cls).assign(shipments)

    @classmethod
    @ModelView.button
    @Workflow.transition('shipped')
    def ship(cls, shipments):
        pool = Pool()
        Location = pool.get('stock.location')
        to_write = []
        for shipment in shipments:
            if not shipment.transit_location or not shipment.locations:
                continue
            to_write.append(list(shipment.locations))
            to_write.append({
                    'parent': shipment.transit_location.id,
                    })
        if to_write:
            Location.write(*to_write)
        super(ShipmentInternal, cls).ship(shipments)

    @classmethod
    @ModelView.button
    @Workflow.transition('done')
    @clear_location_assignation
    def done(cls, shipments):
        pool = Pool()
        Location = pool.get('stock.location')
        to_write = []
        for shipment in shipments:
            if not shipment.locations:
                continue
            to_write.append(list(shipment.locations))
            to_write.append({
                    'parent': shipment.to_location.id,
                    })
        if to_write:
            Location.write(*to_write)
        super(ShipmentInternal, cls).done(shipments)

    @classmethod
    @ModelView.button
    @Workflow.transition('cancelled')
    @clear_location_assignation
    def cancel(cls, shipments):
        super(ShipmentInternal, cls).cancel(shipments)


class ShipmentInternal_Location(ModelSQL):
    "Shipment Internal - Location"
    __name__ = 'stock.shipment.internal-location'

    shipment = fields.Many2One(
        'stock.shipment.internal', "Shipment", required=True)
    location = fields.Many2One(
        'stock.location', "Location", required=True,
        domain=[
            ('type', '=', 'storage'),
            ('movable', '=', True),
            ])


def deactivate_empty_location(func):
    @functools.wraps(func)
    def wrapper(cls, shipments, *args, **kwargs):
        pool = Pool()
        Location = pool.get('stock.location')
        func(cls, shipments, *args, **kwargs)
        locations = set()
        for shipment in shipments:
            locations.update(
                move.from_location for move in shipment.moves
                if move.from_location.movable)
        Location.deactivate_empty(list(locations))
    return wrapper


class ShipmentOut(metaclass=PoolMeta):
    __name__ = 'stock.shipment.out'

    @classmethod
    @ModelView.button
    @Workflow.transition('done')
    @deactivate_empty_location
    def done(cls, shipments):
        super(ShipmentOut, cls).done(shipments)


class ShipmentInReturn(metaclass=PoolMeta):
    __name__ = 'stock.shipment.in.return'

    @classmethod
    @ModelView.button
    @Workflow.transition('done')
    @deactivate_empty_location
    def done(cls, shipments):
        super(ShipmentInReturn, cls).done(shipments)


class Supply(metaclass=PoolMeta):
    __name__ = 'stock.supply'

    def transition_create_(self):
        with Transaction().set_context(forecast_location_move=True):
            return super(Supply, self).transition_create_()
