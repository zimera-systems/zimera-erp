# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

import unittest

try:
    import schwifty
except ImportError:
    schwifty = None

from trytond.model.exceptions import SQLConstraintError
from trytond.modules.bank.exceptions import InvalidBIC
from trytond.modules.currency.tests import create_currency
from trytond.pool import Pool
from trytond.tests.test_tryton import ModuleTestCase, with_transaction


class BankTestCase(ModuleTestCase):
    'Test Bank module'
    module = 'bank'

    @with_transaction()
    def test_bic_validation(self):
        "Test BIC validation"
        pool = Pool()
        Party = pool.get('party.party')
        Bank = pool.get('bank')

        party = Party(name='Test')
        party.save()
        bank = Bank(party=party)
        bank.save()

        bank.bic = 'ABNA BE 2A'
        bank.bic = bank.on_change_with_bic()
        self.assertEqual(bank.bic, 'ABNABE2A')

        bank.save()

        with self.assertRaises(InvalidBIC):
            bank.bic = 'foo'
            bank.save()

    @with_transaction()
    def test_iban_format(self):
        'Test IBAN format'
        pool = Pool()
        Party = pool.get('party.party')
        Bank = pool.get('bank')
        Account = pool.get('bank.account')
        Number = pool.get('bank.account.number')

        party = Party(name='Test')
        party.save()
        bank = Bank(party=party)
        bank.save()
        account, = Account.create([{
                    'bank': bank.id,
                    'numbers': [('create', [{
                                    'type': 'iban',
                                    'number': 'BE82068896274468',
                                    }, {
                                    'type': 'other',
                                    'number': 'not IBAN',
                                    }])],
                    }])

        iban_number, other_number = account.numbers
        self.assertEqual(iban_number.type, 'iban')
        self.assertEqual(other_number.type, 'other')

        # Test format on create
        self.assertEqual(iban_number.number, 'BE82 0688 9627 4468')
        self.assertEqual(other_number.number, 'not IBAN')

        # Test format on write
        iban_number.number = 'BE82068896274468'
        iban_number.type = 'iban'
        iban_number.save()
        self.assertEqual(iban_number.number, 'BE82 0688 9627 4468')

        other_number.number = 'still not IBAN'
        other_number.save()
        self.assertEqual(other_number.number, 'still not IBAN')

        Number.write([iban_number, other_number], {
                'number': 'BE82068896274468',
                })
        self.assertEqual(iban_number.number, 'BE82 0688 9627 4468')
        self.assertEqual(other_number.number, 'BE82068896274468')

    @with_transaction()
    def test_account_rec_name_without_number(self):
        "Test account record name without number"
        pool = Pool()
        Account = pool.get('bank.account')

        account = Account()
        account.save()

        self.assertEqual(account.rec_name, "(%s)" % account.id)

    @with_transaction()
    def test_account_rec_name_with_number(self):
        "Test account record name with number"
        pool = Pool()
        Account = pool.get('bank.account')
        Number = pool.get('bank.account.number')

        account = Account(numbers=[
                Number(type='other', number="1234")])
        account.save()

        self.assertEqual(account.rec_name, "1234")

    @with_transaction()
    def test_account_rec_name_with_bank(self):
        "Test account record name with bank"
        pool = Pool()
        Account = pool.get('bank.account')
        Bank = pool.get('bank')
        Number = pool.get('bank.account.number')
        Party = pool.get('party.party')

        party = Party(name="Bank")
        party.save()
        bank = Bank(party=party)
        bank.save()
        account = Account(
            numbers=[Number(type='other', number="1234")],
            bank=bank)
        account.save()

        self.assertEqual(account.rec_name, "1234 @ Bank")

    @with_transaction()
    def test_account_rec_name_with_currency(self):
        "Test account record name with currency"
        pool = Pool()
        Account = pool.get('bank.account')
        Number = pool.get('bank.account.number')

        currency = create_currency("USD")
        account = Account(
            numbers=[Number(type='other', number="1234")],
            currency=currency)
        account.save()

        self.assertEqual(account.rec_name, "1234 [USD]")

    @with_transaction()
    def test_number_single_iban(self):
        "Test number has single IBAN"
        pool = Pool()
        Account = pool.get('bank.account')
        Number = pool.get('bank.account.number')

        account = Account(numbers=[
                Number(type='iban', number="BE82 0688 9627 4468"),
                Number(type='iban', number="BE67 0682 4952 8887"),
                ])

        with self.assertRaises(SQLConstraintError):
            account.save()

    @with_transaction()
    def test_number_iban_unique(self):
        "Test number has single IBAN"
        pool = Pool()
        Account = pool.get('bank.account')
        Number = pool.get('bank.account.number')

        account = Account(numbers=[
                Number(type='iban', number="BE82 0688 9627 4468"),
                ])
        account.save()
        account = Account(numbers=[
                Number(type='iban', number="BE82 0688 9627 4468"),
                ])

        with self.assertRaises(SQLConstraintError):
            account.save()

    @unittest.skipIf(schwifty is None, "requires schwifty")
    @with_transaction()
    def test_guess_new_bank(self):
        "Test guess new bank"
        pool = Pool()
        Account = pool.get('bank.account')
        Number = pool.get('bank.account.number')

        account = Account(numbers=[
                Number(type='iban', number="BE82 0688 9627 4468")])
        account.save()

        self.assertTrue(account.bank)
        self.assertEqual(account.bank.bic, 'GKCCBEBB')
        self.assertEqual(account.bank.party.name, "BELFIUS BANK")

    @unittest.skipIf(schwifty is None, "requires schwifty")
    @with_transaction()
    def test_guess_existing_bank(self):
        "Test guess existing bank"
        pool = Pool()
        Account = pool.get('bank.account')
        Bank = pool.get('bank')
        Number = pool.get('bank.account.number')

        account1 = Account(numbers=[
                Number(type='iban', number="BE82 0688 9627 4468")])
        account1.save()
        account2 = Account(numbers=[
                Number(type='iban', number="BE67 0682 4952 8887")])
        account2.save()

        self.assertEqual(len(Bank.search([])), 1)

    @with_transaction()
    def test_guess_bank_without_iban(self):
        "Test guess bank without IBAN"
        pool = Pool()
        Account = pool.get('bank.account')
        Number = pool.get('bank.account.number')

        account = Account(numbers=[
                Number(type='other', number="123456")])
        account.save()

        self.assertIsNone(account.bank)


del ModuleTestCase
