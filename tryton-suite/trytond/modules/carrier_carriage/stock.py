# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.i18n import gettext
from trytond.model import (
    ModelSQL, ModelView, Workflow, fields, sequence_ordered)
from trytond.model.exceptions import AccessError
from trytond.modules.stock_shipment_cost import ShipmentCostMixin
from trytond.pool import Pool, PoolMeta
from trytond.pyson import Eval

try:
    from trytond.modules.sale_shipment_cost import ShipmentCostSaleMixin
except ImportError:
    ShipmentCostSaleMixin = object


class Carriage(sequence_ordered(), ShipmentCostMixin, ModelSQL, ModelView):
    "Shipment Carriage"
    __name__ = 'stock.shipment.carriage'

    _states = {
        'readonly': Eval('shipment_cost_readonly', True),
        }

    shipment = fields.Reference(
        "Shipment", selection='get_shipments', required=True, states=_states)
    type = fields.Selection([
            ('before', "Before"),
            ('after', "After"),
            ], "Type", sort=False, required=True, states=_states)
    from_ = fields.Many2One('party.address', "From", states=_states)
    to = fields.Many2One('party.address', "To", states=_states)

    company = fields.Function(
        fields.Many2One('company.company', "Company"),
        'on_change_with_company')

    del _states

    @classmethod
    def __setup__(cls):
        super().__setup__()
        cls.carrier.required = True

    @classmethod
    def get_shipments(cls):
        pool = Pool()
        IrModel = pool.get('ir.model')
        get_name = IrModel.get_name
        models = cls._get_shipments()
        return [(m, get_name(m)) for m in models]

    @classmethod
    def _get_shipments(cls):
        return [
            'stock.shipment.out',
            'stock.shipment.out.return',
            ]

    @fields.depends('shipment')
    def on_change_with_shipment_cost_readonly(self, name=None):
        pool = Pool()
        ShipmentOut = pool.get('stock.shipment.out')
        ShipmentOutReturn = pool.get('stock.shipment.out.return')
        if isinstance(self.shipment, (ShipmentOut, ShipmentOutReturn)):
            return self.shipment.state in {'done', 'cancelled'}

    @fields.depends('shipment')
    def on_change_with_company(self, name=None):
        if self.shipment and self.shipment.company:
            return self.shipment.company.id

    def get_rec_name(self, name):
        return f'{self.carrier.rec_name} @ {self.shipment.rec_name}'

    @classmethod
    def delete(cls, carriages):
        for carriage in carriages:
            if carriage.shipment_cost_readonly:
                raise AccessError(
                    gettext('carrier_carriages.msg_shipment_carriage_delete',
                        carriage=carriage.rec_name))
        super().delete(carriages)


class _ShipmentMixin:
    __slots__ = ()

    _states = {
        'readonly': Eval('shipment_cost_readonly', True),
        }

    carriages = fields.One2Many(
        'stock.shipment.carriage', 'shipment', "Carriages", readonly=True)
    before_carriages = fields.One2Many(
        'stock.shipment.carriage', 'shipment', "Before Carriages",
        filter=[
            ('type', '=', 'before'),
            ],
        states=_states,
        help="Carriages before the main carrier.")
    after_carriages = fields.One2Many(
        'stock.shipment.carriage', 'shipment', "After Carriages",
        filter=[
            ('type', '=', 'after'),
            ],
        states=_states,
        help="Carriages after the main carrier.")

    del _states

    def _get_shipment_cost(self):
        cost = super()._get_shipment_cost()
        for carriage in self.carriages:
            carriage_cost = carriage._get_shipment_cost()
            if carriage_cost:
                cost += carriage_cost
        return cost

    @classmethod
    def delete(cls, shipments):
        pool = Pool()
        Carriage = pool.get('stock.shipment.carriage')
        carriages = sum((s.carriages for s in shipments), ())
        super().delete(shipments)
        Carriage.delete(carriages)

    @classmethod
    def copy(cls, shipments, default=None):
        if default is None:
            default = {}
        else:
            default = default.copy()
        default.setdefault('before_carriages')
        default.setdefault('after_carriages')
        return super().copy(shipments, default=default)


class Carriage_Sale(ShipmentCostSaleMixin, metaclass=PoolMeta):
    __name__ = 'stock.shipment.carriage'

    @fields.depends('shipment')
    def on_change_with_shipment_cost_sale_readonly(self, name=None):
        pool = Pool()
        ShipmentOut = pool.get('stock.shipment.out')
        if isinstance(self.shipment, ShipmentOut):
            return self.shipment.state in {'done', 'cancelled'}

    def get_cost_invoice_line(self, invoice):
        invoice_line = super().get_cost_invoice_line(invoice)
        if invoice_line:
            invoice_line.cost_shipment_carriages = [self]
        return invoice_line

    @classmethod
    def from_sale(cls, carriage):
        return cls(
            sequence=carriage.sequence,
            type=carriage.type,
            carrier=carriage.carrier,
            cost_method=carriage.cost_method,
            from_=carriage.from_,
            to=carriage.to,
            )


class _ShipmentOutMixin(_ShipmentMixin):

    @classmethod
    @ModelView.button
    @Workflow.transition('done')
    def done(cls, shipments):
        pool = Pool()
        Carriage = pool.get('stock.shipment.carriage')
        has_cost_sale = hasattr(Carriage, 'cost_sale')
        carriages = []
        for shipment in shipments:
            for carriage in shipment.carriages:
                carriage.cost = carriage.cost_used
                carriage.cost_currency = carriage.cost_currency_used
                if has_cost_sale:
                    carriage.cost_sale = carriage.cost_sale_used
                    carriage.cost_sale_currency = (
                        carriage.cost_sale_currency_used)
                carriages.append(carriage)
        Carriage.save(carriages)
        super().done(shipments)


class ShipmentOut(_ShipmentOutMixin, metaclass=PoolMeta):
    __name__ = 'stock.shipment.out'


class ShipmentOutReturn(_ShipmentOutMixin, metaclass=PoolMeta):
    __name__ = 'stock.shipment.out.return'


class Carriage_Purchase(metaclass=PoolMeta):
    __name__ = 'stock.shipment.carriage'

    @classmethod
    def _get_shipments(cls):
        return super()._get_shipments() + ['stock.shipment.in']

    @fields.depends('shipment')
    def on_change_with_shipment_cost_readonly(self, name=None):
        pool = Pool()
        ShipmentIn = pool.get('stock.shipment.in')
        readonly = super().on_change_with_shipment_cost_readonly(name=name)
        if isinstance(self.shipment, ShipmentIn):
            readonly = self.shipment.state != 'draft'
        return readonly


class ShipmentIn(_ShipmentMixin, metaclass=PoolMeta):
    __name__ = 'stock.shipment.in'

    @classmethod
    @ModelView.button
    @Workflow.transition('received')
    def receive(cls, shipments):
        pool = Pool()
        Carriage = pool.get('stock.shipment.carriage')
        carriages = []
        for shipment in shipments:
            for carriage in shipment.carriages:
                carriage.cost = carriage.cost_used
                carriage.cost_currency = carriage.cost_currency_used
        Carriage.save(carriages)
        super().receive(shipments)
