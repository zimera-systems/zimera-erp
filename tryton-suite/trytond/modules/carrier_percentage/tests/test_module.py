# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from decimal import Decimal

from trytond.modules.currency.tests import create_currency
from trytond.pool import Pool
from trytond.tests.test_tryton import ModuleTestCase, with_transaction


class CarrierPercentageTestCase(ModuleTestCase):
    'Test CarrierPercentage module'
    module = 'carrier_percentage'
    extras = [
        'purchase_shipment_cost', 'sale_shipment_cost', 'stock_shipment_cost']

    @with_transaction()
    def test_compute_percentage(self):
        'Test compute_percentage'
        pool = Pool()
        Party = pool.get('party.party')
        Uom = pool.get('product.uom')
        Template = pool.get('product.template')
        Product = pool.get('product.product')
        Carrier = pool.get('carrier')

        party, = Party.create([{
                    'name': 'Carrier',
                    }])
        uom, = Uom.search([
                ('name', '=', 'Unit'),
                ])
        template, = Template.create([{
                    'name': 'Carrier',
                    'default_uom': uom.id,
                    'type': 'service',
                    }])
        product, = Product.create([{
                    'template': template.id,
                    }])
        currency = create_currency('cu1')
        carrier, = Carrier.create([{
                    'party': party.id,
                    'carrier_product': product.id,
                    'carrier_cost_method': 'percentage',
                    'percentage': Decimal(15),
                    }])
        for amount, price in [
                (Decimal(0), Decimal(0)),
                (Decimal(100), Decimal('15.00')),
                (Decimal(150), Decimal('22.50')),
                ]:
            self.assertEqual(
                carrier.compute_percentage(amount, currency.id),
                (price, currency.id))


del ModuleTestCase
