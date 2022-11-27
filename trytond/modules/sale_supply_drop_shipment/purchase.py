# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from trytond import backend
from trytond.i18n import gettext
from trytond.model import ModelSQL, ValueMixin, fields
from trytond.model.exceptions import RequiredValidationError
from trytond.modules.product import round_price
from trytond.modules.purchase.purchase import (
    get_shipments_returns, search_shipments_returns)
from trytond.pool import Pool, PoolMeta
from trytond.pyson import Eval
from trytond.tools.multivalue import migrate_property
from trytond.transaction import Transaction

purchase_drop_location = fields.Many2One(
    'stock.location', "Purchase Drop Location", domain=[('type', '=', 'drop')])


class Request(metaclass=PoolMeta):
    __name__ = 'purchase.request'

    customer = fields.Many2One('party.party', 'Customer', readonly=True,
        states={
            'invisible': ~Eval('customer'),
            },
        context={
            'company': Eval('company', -1),
            },
        depends={'company'})
    delivery_address = fields.Many2One('party.address', 'Delivery Address',
        domain=[('party', '=', Eval('customer'))],
        states={
            'invisible': ~Eval('customer'),
            'readonly': Eval('state') != 'draft',
            })


class Configuration(metaclass=PoolMeta):
    __name__ = 'purchase.configuration'

    purchase_drop_location = fields.MultiValue(purchase_drop_location)

    @classmethod
    def default_purchase_drop_location(cls, **pattern):
        return cls.multivalue_model(
            'purchase_drop_location').default_purchase_drop_location()


class ConfigurationPurchaseDropLocation(ModelSQL, ValueMixin):
    "Purchase Configuration Purchase Drop Location"
    __name__ = 'purchase.configuration.purchase_drop_location'
    purchase_drop_location = purchase_drop_location

    @classmethod
    def __register__(cls, module_name):
        exist = backend.TableHandler.table_exist(cls._table)

        super().__register__(module_name)

        if not exist:
            cls._migrate_property([], [], [])

    @classmethod
    def _migrate_property(cls, field_names, value_names, fields):
        field_names.append('purchase_drop_location')
        value_names.append('purchase_drop_location')
        migrate_property(
            'purchase.configuration', field_names, cls, value_names,
            fields=fields)

    @classmethod
    def default_purchase_drop_location(cls):
        pool = Pool()
        ModelData = pool.get('ir.model.data')
        try:
            return ModelData.get_id(
                'sale_supply_drop_shipment', 'location_drop')
        except KeyError:
            return None


class Purchase(metaclass=PoolMeta):
    __name__ = 'purchase.purchase'

    customer = fields.Many2One('party.party', 'Customer', readonly=True,
        states={
            'invisible': ~Eval('customer'),
            },
        context={
            'company': Eval('company', -1),
            },
        depends={'company'})
    delivery_address = fields.Many2One('party.address', 'Delivery Address',
        domain=[('party', '=', Eval('customer'))],
        states={
            'readonly': Eval('state') != 'draft',
            'invisible': ~Eval('customer'),
            })
    drop_shipments = fields.Function(fields.Many2Many('stock.shipment.drop',
            None, None, "Drop Shipments",
            states={
                'invisible': ~Eval('customer'),
                }),
        'get_drop_shipments', searcher='search_drop_shipments')
    drop_location = fields.Many2One('stock.location', 'Drop Location',
        domain=[('type', '=', 'drop')],
        states={
            'invisible': ~Eval('customer', False),
            'required': Eval('customer', False),
            })

    @staticmethod
    def default_drop_location():
        pool = Pool()
        PurchaseConfig = pool.get('purchase.configuration')

        config = PurchaseConfig(1)
        if config.purchase_drop_location:
            return config.purchase_drop_location.id

    @fields.depends('customer', 'delivery_address')
    def on_change_customer(self):
        self.delivery_address = None
        if self.customer:
            self.delivery_address = self.customer.address_get(type='delivery')

    @property
    def delivery_full_address(self):
        address = super(Purchase, self).delivery_full_address
        if self.customer and self.delivery_address:
            address = self.delivery_address.full_address
        return address

    get_drop_shipments = get_shipments_returns('stock.shipment.drop')
    search_drop_shipments = search_shipments_returns('stock.shipment.drop')

    def check_for_quotation(self):
        super(Purchase, self).check_for_quotation()
        if self.customer and not self.delivery_address:
            raise RequiredValidationError(
                gettext('sale_supply_drop_shipment'
                    '.msg_delivery_address_required_quotation_purchase') % {
                    'purchase': self.rec_name,
                    })

    @classmethod
    def _process_shipment(cls, purchases):
        pool = Pool()
        DropShipment = pool.get('stock.shipment.drop')

        drop_shipments = []
        for purchase in purchases:
            if purchase.customer:
                moves = purchase.create_move('in')
                if moves:
                    drop_shipment = purchase.create_drop_shipment()
                    drop_shipment.supplier_moves = moves
                    drop_shipments.append(drop_shipment)
        DropShipment.save(drop_shipments)
        DropShipment.wait(drop_shipments)
        super()._process_shipment(purchases)

    def create_drop_shipment(self):
        pool = Pool()
        DropShipment = pool.get('stock.shipment.drop')

        return DropShipment(
            company=self.company,
            supplier=self.party,
            contact_address=self.party.address_get(),
            customer=self.customer,
            delivery_address=self.delivery_address,
            )


class Line(metaclass=PoolMeta):
    __name__ = 'purchase.line'

    def get_to_location(self, name):
        result = super().get_to_location(name)
        if self.purchase.customer:
            return self.purchase.drop_location.id
        return result

    def get_move(self, move_type):
        pool = Pool()
        Currency = pool.get('currency.currency')
        move = super().get_move(move_type)
        if move and self.purchase.customer:
            cost_price = Currency.compute(
                move.currency, move.unit_price, move.company.currency)
            move.cost_price = round_price(cost_price)
        return move


class ProductSupplier(metaclass=PoolMeta):
    __name__ = 'purchase.product_supplier'

    drop_shipment = fields.Boolean('Drop Shipment',
        states={
            'invisible': ~Eval('drop_shipment_available', False),
            })
    drop_shipment_available = fields.Function(
        fields.Boolean("Drop Shipment Available"),
        'on_change_with_drop_shipment_available')

    @fields.depends('product', 'template',
        '_parent_product.type', '_parent_product.supply_on_sale',
        '_parent_template.type', '_parent_template.supply_on_sale')
    def on_change_with_drop_shipment_available(self, name=None):
        product = self.product or self.template
        if product and product.type in {'goods', 'assets'}:
            return product.supply_on_sale


class RequestCreatePurchase(metaclass=PoolMeta):
    __name__ = 'purchase.request.create_purchase'

    @classmethod
    def _group_purchase_key(cls, requests, request):
        result = super()._group_purchase_key(requests, request)
        result += (
            ('customer', request.customer.id if request.customer else None),
            ('delivery_address', request.delivery_address.id
                if request.delivery_address else None),
            )
        return result


class HandleShipmentException(metaclass=PoolMeta):
    __name__ = 'purchase.handle.shipment.exception'

    def transition_handle(self):
        pool = Pool()
        Sale = pool.get('sale.sale')
        Move = pool.get('stock.move')
        transaction = Transaction()
        context = transaction.context

        super().transition_handle()

        sales = set()
        moves = set()
        to_recreate = set(self.ask.recreate_moves)
        domain_moves = set(self.ask.domain_moves)

        for line in self.record.lines:
            if not set(line.moves) & domain_moves:
                continue
            if not any(m in to_recreate for m in line.moves):
                for request in line.requests:
                    for sale_line in request.sale_lines:
                        moves.update({m for m in sale_line.moves
                                if (m.state != 'done'
                                    and m.from_location.type == 'drop')})
                        sales.add(sale_line.sale)

        if moves:
            Move.cancel(moves)
        if sales:
            with transaction.set_context(
                    queue_batch=context.get('queue_batch', True)):
                Sale.__queue__.process(sales)
        return 'end'
