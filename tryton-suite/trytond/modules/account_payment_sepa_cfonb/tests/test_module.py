# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.modules.account_payment_sepa.tests import validate_file
from trytond.modules.company.tests import CompanyTestMixin
from trytond.tests.test_tryton import ModuleTestCase, with_transaction


class AccountPaymentSepaCFONBTestCase(CompanyTestMixin, ModuleTestCase):
    'Test Account Payment SEPA CFONB module'
    module = 'account_payment_sepa_cfonb'

    @with_transaction()
    def test_pain001_001_03_cfonb(self):
        'Test pain.00r.001.03-cfonb xsd validation'
        validate_file('pain.001.001.03-cfonb', 'payable',
            xsd='pain.001.001.03')

    @with_transaction()
    def test_pain008_001_02_cfonb(self):
        'Test pain.008.001.02-cfonb xsd validation'
        validate_file('pain.008.001.02-cfonb', 'receivable',
            xsd='pain.008.001.02')


del ModuleTestCase
