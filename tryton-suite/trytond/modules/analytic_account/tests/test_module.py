# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from decimal import Decimal

from trytond.modules.account.tests import create_chart, get_fiscalyear
from trytond.modules.company.tests import (
    CompanyTestMixin, create_company, set_company)
from trytond.modules.currency.tests import create_currency
from trytond.pool import Pool
from trytond.tests.test_tryton import ModuleTestCase, with_transaction
from trytond.transaction import Transaction


class AnalyticAccountTestCase(CompanyTestMixin, ModuleTestCase):
    'Test AnalyticAccount module'
    module = 'analytic_account'

    @with_transaction()
    def test_account_debit_credit(self):
        'Test account debit/credit'
        pool = Pool()
        Party = pool.get('party.party')
        AnalyticAccount = pool.get('analytic_account.account')
        Journal = pool.get('account.journal')
        Account = pool.get('account.account')
        Move = pool.get('account.move')
        transaction = Transaction()

        party = Party(name='Party')
        party.save()
        company = create_company()
        with set_company(company):
            root, = AnalyticAccount.create([{
                        'type': 'root',
                        'name': 'Root',
                        }])
            analytic_account, = AnalyticAccount.create([{
                        'type': 'normal',
                        'name': 'Analytic Account',
                        'parent': root.id,
                        'root': root.id,
                        }])
            create_chart(company)
            fiscalyear = get_fiscalyear(company)
            fiscalyear.save()
            fiscalyear.create_period([fiscalyear])
            period = fiscalyear.periods[0]
            journal_revenue, = Journal.search([
                    ('code', '=', 'REV'),
                    ])
            journal_expense, = Journal.search([
                    ('code', '=', 'EXP'),
                    ])
            revenue, = Account.search([
                    ('type.revenue', '=', True),
                    ])
            receivable, = Account.search([
                    ('type.receivable', '=', True),
                    ])
            expense, = Account.search([
                    ('type.expense', '=', True),
                    ])
            payable, = Account.search([
                    ('type.payable', '=', True),
                    ])

            first_account_line = {
                'account': revenue.id,
                'credit': Decimal(100),
                'analytic_lines': [
                    ('create', [{
                                'account': analytic_account.id,
                                'credit': Decimal(100),
                                'debit': Decimal(0),
                                'date': period.start_date,
                                }])
                    ]}
            second_account_line = {
                'account': expense.id,
                'debit': Decimal(30),
                'analytic_lines': [
                    ('create', [{
                                'account': analytic_account.id,
                                'debit': Decimal(30),
                                'credit': Decimal(0),
                                'date': period.start_date,
                                }])
                    ]}
            # Create some moves
            vlist = [{
                    'period': period.id,
                    'journal': journal_revenue.id,
                    'date': period.start_date,
                    'lines': [
                        ('create', [first_account_line, {
                                    'account': receivable.id,
                                    'debit': Decimal(100),
                                    'party': party.id,
                                    }]),
                        ],
                    }, {
                    'period': period.id,
                    'journal': journal_expense.id,
                    'date': period.start_date,
                    'lines': [
                        ('create', [second_account_line, {
                                    'account': payable.id,
                                    'credit': Decimal(30),
                                    'party': party.id,
                                    }]),
                        ],
                    },
                ]
            Move.create(vlist)

            self.assertEqual((analytic_account.debit, analytic_account.credit),
                (Decimal(30), Decimal(100)))
            self.assertEqual(analytic_account.balance, Decimal(70))

            with transaction.set_context(start_date=period.end_date):
                analytic_account = AnalyticAccount(analytic_account.id)
                self.assertEqual((analytic_account.debit,
                        analytic_account.credit),
                    (Decimal(0), Decimal(0)))
                self.assertEqual(analytic_account.balance, Decimal(0))

            with transaction.set_context(end_date=period.end_date):
                analytic_account = AnalyticAccount(analytic_account.id)
                self.assertEqual((analytic_account.debit,
                        analytic_account.credit),
                    (Decimal(30), Decimal(100)))
                self.assertEqual(analytic_account.balance, Decimal(70))

    def _test_analytic_line_state(self):
        pool = Pool()
        Party = pool.get('party.party')
        AnalyticAccount = pool.get('analytic_account.account')
        AnalyticLine = pool.get('analytic_account.line')
        Journal = pool.get('account.journal')
        Account = pool.get('account.account')
        Move = pool.get('account.move')
        MoveLine = pool.get('account.move.line')

        party = Party(name='Party')
        party.save()
        company = create_company()
        with set_company(company):
            root, = AnalyticAccount.create([{
                        'type': 'root',
                        'name': 'Root',
                        }])
            analytic_account1, analytic_account2 = AnalyticAccount.create([{
                        'type': 'normal',
                        'name': 'Analytic Account 1',
                        'parent': root.id,
                        'root': root.id,
                        }, {
                        'type': 'normal',
                        'name': 'Analytic Account 2',
                        'parent': root.id,
                        'root': root.id,
                        }])
            create_chart(company)
            fiscalyear = get_fiscalyear(company)
            fiscalyear.save()
            fiscalyear.create_period([fiscalyear])
            period = fiscalyear.periods[0]
            journal_expense, = Journal.search([
                    ('code', '=', 'EXP'),
                    ])
            expense, = Account.search([
                    ('type.expense', '=', True),
                    ])
            payable, = Account.search([
                    ('type.payable', '=', True),
                    ])

            move = Move()
            move.period = period
            move.journal = journal_expense
            move.date = period.start_date
            move.lines = [
                MoveLine(account=expense, debit=Decimal(100)),
                MoveLine(account=payable, credit=Decimal(100), party=party),
                ]
            move.save()
            Move.post([move])

            expense_line, = [l for l in move.lines if l.account == expense]
            payable_line, = [l for l in move.lines if l.account == payable]

            self.assertEqual(expense_line.analytic_state, 'draft')
            self.assertEqual(payable_line.analytic_state, 'valid')

            expense_line.analytic_lines = [
                AnalyticLine(
                    account=analytic_account1,
                    debit=Decimal(50),
                    date=period.start_date),
                AnalyticLine(
                    account=analytic_account2,
                    debit=Decimal(50),
                    date=period.start_date),
                ]
            expense_line.save()

            self.assertEqual(expense_line.analytic_state, 'valid')

    @with_transaction()
    def test_move_line_state(self):
        "Test move line state"
        self._test_analytic_line_state()

    @with_transaction()
    def test_move_line_state_roots_several_companies(self):
        "Test move line state with roots from several companies"
        pool = Pool()
        Account = pool.get('analytic_account.account')

        extra_company = create_company()
        with set_company(extra_company):
            root, = Account.create([{
                        'type': 'root',
                        'name': 'Root',
                        }])
            analytic_account, = Account.create([{
                        'type': 'normal',
                        'name': 'Analytic Account',
                        'parent': root.id,
                        'root': root.id,
                        }])
        self._test_analytic_line_state()

    @with_transaction()
    def test_account_distribute(self):
        "Test account distribute"
        pool = Pool()
        Account = pool.get('analytic_account.account')
        Distribution = pool.get('analytic_account.account.distribution')

        currency = create_currency('usd')
        account1 = Account(type='normal', currency=currency)
        account2 = Account(type='normal', currency=currency)
        account = Account(type='distribution', currency=currency)
        account.distributions = [
            Distribution(account=account1, ratio=Decimal('0.7')),
            Distribution(account=account2, ratio=Decimal('0.3')),
            ]

        self.assertListEqual(
            account.distribute(Decimal('100.03')),
            [(account1, Decimal('70.02')), (account2, Decimal('30.01'))])

    @with_transaction()
    def test_account_distribute_remainder(self):
        "Test account distribute remainder"
        pool = Pool()
        Account = pool.get('analytic_account.account')
        Distribution = pool.get('analytic_account.account.distribution')

        currency = create_currency('usd')
        account1 = Account(type='normal', currency=currency)
        account2 = Account(type='normal', currency=currency)
        account3 = Account(type='normal', currency=currency)
        account = Account(type='distribution', currency=currency)
        account.distributions = [
            Distribution(account=account1, ratio=Decimal('0.5')),
            Distribution(account=account2, ratio=Decimal('0.375')),
            Distribution(account=account3, ratio=Decimal('0.125')),
            ]

        self.assertListEqual(
            account.distribute(Decimal('65.35')), [
                (account1, Decimal('32.67')),
                (account2, Decimal('24.51')),
                (account3, Decimal('8.17'))])


del ModuleTestCase
