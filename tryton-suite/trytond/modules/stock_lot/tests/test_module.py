# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

import datetime
from decimal import Decimal

from dateutil.relativedelta import relativedelta

from trytond.modules.company.tests import (
    CompanyTestMixin, create_company, set_company)
from trytond.pool import Pool
from trytond.tests.test_tryton import ModuleTestCase, with_transaction
from trytond.transaction import Transaction


class StockLotTestCase(CompanyTestMixin, ModuleTestCase):
    'Test Stock Lot module'
    module = 'stock_lot'

    @with_transaction()
    def test_products_by_location(self):
        'Test products_by_location'
        pool = Pool()
        Uom = pool.get('product.uom')
        Template = pool.get('product.template')
        Product = pool.get('product.product')
        Location = pool.get('stock.location')
        Move = pool.get('stock.move')
        Lot = pool.get('stock.lot')

        kg, = Uom.search([('name', '=', 'Kilogram')])
        g, = Uom.search([('name', '=', 'Gram')])
        template, = Template.create([{
                    'name': 'Test products_by_location',
                    'type': 'goods',
                    'default_uom': kg.id,
                    }])
        product, = Product.create([{
                    'template': template.id,
                    }])
        supplier, = Location.search([('code', '=', 'SUP')])
        customer, = Location.search([('code', '=', 'CUS')])
        storage, = Location.search([('code', '=', 'STO')])
        company = create_company()
        currency = company.currency
        with set_company(company):
            lot1, lot2 = Lot.create([{
                        'number': '1',
                        'product': product.id,
                        }, {
                        'number': '2',
                        'product': product.id,
                        }])

            moves = Move.create([{
                        'product': product.id,
                        'lot': lot1.id,
                        'uom': kg.id,
                        'quantity': 5,
                        'from_location': supplier.id,
                        'to_location': storage.id,
                        'company': company.id,
                        'unit_price': Decimal('1'),
                        'currency': currency.id,
                        }, {
                        'product': product.id,
                        'lot': lot2.id,
                        'uom': kg.id,
                        'quantity': 10,
                        'from_location': supplier.id,
                        'to_location': storage.id,
                        'company': company.id,
                        'unit_price': Decimal('1'),
                        'currency': currency.id,
                        }, {
                        'product': product.id,
                        'lot': lot2.id,
                        'uom': kg.id,
                        'quantity': 2,
                        'from_location': storage.id,
                        'to_location': customer.id,
                        'company': company.id,
                        'unit_price': Decimal('1'),
                        'currency': currency.id,
                        }, {
                        'product': product.id,
                        'lot': None,
                        'uom': kg.id,
                        'quantity': 3,
                        'from_location': supplier.id,
                        'to_location': storage.id,
                        'company': company.id,
                        'unit_price': Decimal('1'),
                        'currency': currency.id,
                        }])
            Move.do(moves)

            self.assertEqual(Product.products_by_location([storage.id],
                    grouping_filter=([product.id],)), {
                    (storage.id, product.id): 16,
                    })
            self.assertEqual(Product.products_by_location([storage.id],
                    grouping=('product', 'lot',),
                    grouping_filter=([product.id],)), {
                    (storage.id, product.id, lot1.id): 5,
                    (storage.id, product.id, lot2.id): 8,
                    (storage.id, product.id, None): 3,
                    })
            with Transaction().set_context(locations=[storage.id]):
                lot1, lot2 = Lot.browse([lot1, lot2])
                self.assertEqual(lot1.quantity, 5)
                self.assertEqual(lot2.quantity, 8)

    @with_transaction()
    def test_period(self):
        'Test period'
        pool = Pool()
        Uom = pool.get('product.uom')
        Template = pool.get('product.template')
        Product = pool.get('product.product')
        Location = pool.get('stock.location')
        Move = pool.get('stock.move')
        Lot = pool.get('stock.lot')
        Period = pool.get('stock.period')

        unit, = Uom.search([('name', '=', 'Unit')])
        template, = Template.create([{
                    'name': 'Test period',
                    'type': 'goods',
                    'default_uom': unit.id,
                    }])
        product, = Product.create([{
                    'template': template.id,
                    }])
        supplier, = Location.search([('code', '=', 'SUP')])
        storage, = Location.search([('code', '=', 'STO')])
        company = create_company()
        currency = company.currency
        with set_company(company):
            lot1, lot2 = Lot.create([{
                        'number': '1',
                        'product': product.id,
                        }, {
                        'number': '2',
                        'product': product.id,
                        }])

            today = datetime.date.today()

            moves = Move.create([{
                        'product': product.id,
                        'lot': lot1.id,
                        'uom': unit.id,
                        'quantity': 5,
                        'from_location': supplier.id,
                        'to_location': storage.id,
                        'planned_date': today - relativedelta(days=1),
                        'effective_date': today - relativedelta(days=1),
                        'company': company.id,
                        'unit_price': Decimal('1'),
                        'currency': currency.id,
                        }, {
                        'product': product.id,
                        'lot': lot2.id,
                        'uom': unit.id,
                        'quantity': 10,
                        'from_location': supplier.id,
                        'to_location': storage.id,
                        'planned_date': today - relativedelta(days=1),
                        'effective_date': today - relativedelta(days=1),
                        'company': company.id,
                        'unit_price': Decimal('1'),
                        'currency': currency.id,
                        }, {
                        'product': product.id,
                        'lot': None,
                        'uom': unit.id,
                        'quantity': 3,
                        'from_location': supplier.id,
                        'to_location': storage.id,
                        'planned_date': today - relativedelta(days=1),
                        'effective_date': today - relativedelta(days=1),
                        'company': company.id,
                        'unit_price': Decimal('1'),
                        'currency': currency.id,
                        }])
            Move.do(moves)

            period, = Period.create([{
                        'date': today - relativedelta(days=1),
                        'company': company.id,
                        }])
            Period.close([period])
            self.assertEqual(period.state, 'closed')

            quantities = {
                supplier: -18,
                storage: 18,
                }
            for cache in period.caches:
                self.assertEqual(cache.product, product)
                self.assertEqual(cache.internal_quantity,
                    quantities[cache.location])

            quantities = {
                (supplier, lot1): -5,
                (storage, lot1): 5,
                (supplier, lot2): -10,
                (storage, lot2): 10,
                (supplier, None): -3,
                (storage, None): 3,
                }
            for lot_cache in period.lot_caches:
                self.assertEqual(lot_cache.product, product)
                self.assertEqual(lot_cache.internal_quantity,
                    quantities[(lot_cache.location, lot_cache.lot)])

    @with_transaction
    def test_assign_try_with_lot(self):
        "Test Move assign_try with lot"
        pool = Pool()
        Template = pool.get('product.template')
        Product = pool.get('product.product')
        Uom = pool.get('product.uom')
        Location = pool.get('stock.location')
        Move = pool.get('stock.move')
        Lot = pool.get('stock.lot')

        uom, = Uom.search([('name', '=', 'Meter')])
        template = Template(
            name="Product",
            type='goods',
            default_uom=uom,
            )
        template.save()
        product = Product(template=template.id)
        product.save()

        supplier, = Location.search([('code', '=', 'SUP')])
        storage, = Location.search([('code', '=', 'STO')])
        customer, = Location.search([('code', '=', 'CUS')])

        company = create_company()
        with set_company(company):
            lot1, lot2 = Lot.create([{
                        'number': "1",
                        'product': product.id,
                        }, {
                        'number': "2",
                        'product': product.id,
                        }])
            moves = Move.create([{
                        'product': product.id,
                        'lot': lot1.id,
                        'uom': uom.id,
                        'quantity': 2,
                        'from_location': supplier.id,
                        'to_location': storage.id,
                        'company': company.id,
                        'unit_price': Decimal(1),
                        'currency': company.currency.id,
                        }, {
                        'product': product.id,
                        'lot': lot2.id,
                        'uom': uom.id,
                        'quantity': 3,
                        'from_location': supplier.id,
                        'to_location': storage.id,
                        'company': company.id,
                        'unit_price': Decimal(1),
                        'currency': company.currency.id,
                        }, {
                        'product': product.id,
                        'lot': None,
                        'uom': uom.id,
                        'quantity': 3,
                        'from_location': supplier.id,
                        'to_location': storage.id,
                        'company': company.id,
                        'unit_price': Decimal(1),
                        'currency': company.currency.id,
                        }])
            Move.do(moves)

            move, = Move.create([{
                        'product': product.id,
                        'uom': uom.id,
                        'quantity': 10,
                        'from_location': storage.id,
                        'to_location': customer.id,
                        'company': company.id,
                        'unit_price': Decimal(1),
                        'currency': company.currency.id,
                        }])

            self.assertFalse(
                Move.assign_try([move], grouping=('product', 'lot')))
            moves = Move.search([
                    ('product', '=', product.id),
                    ('from_location', '=', storage.id),
                    ('to_location', '=', customer.id),
                    ('company', '=', company.id),
                    ])
            self.assertEqual(len(moves), 4)
            self.assertEqual({
                    (m.lot, m.quantity, m.state) for m in moves}, {
                    (lot1, 2, 'assigned'),
                    (lot2, 3, 'assigned'),
                    (None, 1, 'assigned'),
                    (None, 4, 'draft'),
                    })


del ModuleTestCase
