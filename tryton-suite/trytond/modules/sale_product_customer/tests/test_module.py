# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.tests.test_tryton import ModuleTestCase


class SaleProductCustomerTestCase(ModuleTestCase):
    'Test Sale Product Customer module'
    module = 'sale_product_customer'
    extras = ['sale_amendment', 'sale_blanket_agreement']


del ModuleTestCase
