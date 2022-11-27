================================
Account Payment Dunning Scenario
================================

Imports::

    >>> import datetime as dt
    >>> from decimal import Decimal

    >>> from proteus import Model, Wizard
    >>> from trytond.tests.tools import activate_modules, set_user
    >>> from trytond.modules.company.tests.tools import (
    ...     create_company, get_company)
    >>> from trytond.modules.account.tests.tools import (
    ...     create_fiscalyear, create_chart, get_accounts)

    >>> today = dt.date.today()

Activate modules::

    >>> config = activate_modules(['account_payment', 'account_dunning'])

    >>> Dunning = Model.get('account.dunning')
    >>> Journal = Model.get('account.journal')
    >>> Move = Model.get('account.move')
    >>> Party = Model.get('party.party')
    >>> PaymentJournal = Model.get('account.payment.journal')
    >>> Procedure = Model.get('account.dunning.procedure')

Create company::

    >>> _ = create_company()
    >>> company = get_company()

Create chart of accounts::

    >>> _ = create_chart(company)
    >>> accounts = get_accounts(company)

    >>> expense_journal, = Journal.find([('code', '=', 'EXP')])

Create fiscal year::

    >>> fiscalyear = create_fiscalyear(company)
    >>> fiscalyear.click('create_period')

Create dunning procedure::

    >>> procedure = Procedure(name='Procedure')
    >>> level = procedure.levels.new(overdue=dt.timedelta(0))
    >>> procedure.save()

Create payment journal::

    >>> payment_journal = PaymentJournal(
    ...     name='Manual',
    ...     process_method='manual')
    >>> payment_journal.save()

Create parties::

    >>> customer = Party(name='Customer')
    >>> customer.dunning_procedure = procedure
    >>> customer.save()

Create payable move::

    >>> move = Move()
    >>> move.journal = expense_journal
    >>> line = move.lines.new()
    >>> line.party = customer
    >>> line.account = accounts['receivable']
    >>> line.debit = Decimal('50.00')
    >>> line.maturity_date = today
    >>> line = move.lines.new()
    >>> line.account = accounts['revenue']
    >>> line.credit = Decimal('50.00')
    >>> move.click('post')

Make a payment::

    >>> line, = [l for l in move.lines if l.account == accounts['receivable']]
    >>> line.payment_amount
    Decimal('50.00')
    >>> pay_line = Wizard('account.move.line.pay', [line])
    >>> pay_line.execute('next_')
    >>> pay_line.execute('next_')
    >>> payment, = line.payments
    >>> line.payment_amount
    Decimal('0.00')

Create no dunning::

    >>> create_dunning = Wizard('account.dunning.create')
    >>> create_dunning.execute('create_')
    >>> Dunning.find([])
    []

Fail the payment::

    >>> payment.click('submit')
    >>> process_payment = Wizard('account.payment.process', [payment])
    >>> process_payment.execute('process')
    >>> payment.click('fail')
    >>> payment.state
    'failed'
    >>> line.reload()
    >>> line.payment_amount
    Decimal('50.00')

Create dunning::

    >>> create_dunning = Wizard('account.dunning.create')
    >>> create_dunning.execute('create_')
    >>> dunning, = Dunning.find([])
    >>> dunning.line == line
    True

Recreate a payment::

    >>> pay_line = Wizard('account.move.line.pay', [line])
    >>> pay_line.execute('next_')
    >>> pay_line.execute('next_')
    >>> _, payment = line.payments
    >>> payment.state
    'draft'

Dunning is inactive::

    >>> dunning.reload()
    >>> dunning.active
    False
    >>> Dunning.find([])
    []
