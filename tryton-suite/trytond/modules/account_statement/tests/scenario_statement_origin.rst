=================================
Account Statement Origin Scenario
=================================

Imports::

    >>> import datetime
    >>> from decimal import Decimal
    >>> from proteus import Model, Wizard, Report
    >>> from trytond.tests.tools import activate_modules
    >>> from trytond.modules.company.tests.tools import create_company, \
    ...     get_company
    >>> from trytond.modules.account.tests.tools import create_fiscalyear, \
    ...     create_chart, get_accounts
    >>> from trytond.modules.account_invoice.tests.tools import \
    ...     set_fiscalyear_invoice_sequences
    >>> today = datetime.date.today()

Activate modules::

    >>> config = activate_modules('account_statement')

Create company::

    >>> _ = create_company()
    >>> company = get_company()

Create fiscal year::

    >>> fiscalyear = set_fiscalyear_invoice_sequences(
    ...     create_fiscalyear(company))
    >>> fiscalyear.click('create_period')

Create chart of accounts::

    >>> _ = create_chart(company)
    >>> accounts = get_accounts(company)
    >>> receivable = accounts['receivable']
    >>> expense = accounts['expense']
    >>> cash = accounts['cash']

Create parties::

    >>> Party = Model.get('party.party')
    >>> customer = Party(name="Customer")
    >>> customer.save()

Create a statement with origins::

    >>> AccountJournal = Model.get('account.journal')
    >>> StatementJournal = Model.get('account.statement.journal')
    >>> Statement = Model.get('account.statement')
    >>> account_journal, = AccountJournal.find([('code', '=', 'STA')], limit=1)
    >>> journal_number = StatementJournal(name="Number",
    ...     journal=account_journal,
    ...     account=cash,
    ...     validation='number_of_lines',
    ...     )
    >>> journal_number.save()

    >>> statement = Statement(name="number origins")
    >>> statement.journal = journal_number
    >>> statement.number_of_lines = 1
    >>> origin = statement.origins.new()
    >>> origin.date = today
    >>> origin.amount = Decimal('50.00')
    >>> origin.party = customer
    >>> statement.click('validate_statement')

Statement can not be posted until all origins are finished::

    >>> statement.click('post')  # doctest: +IGNORE_EXCEPTION_DETAIL
    Traceback (most recent call last):
        ...
    StatementPostError: ...
    >>> statement.click('draft')
    >>> origin, = statement.origins
    >>> line = origin.lines.new()
    >>> line.date == today
    True
    >>> line.amount
    Decimal('50.00')
    >>> line.party == customer
    True
    >>> line.account == receivable
    True
    >>> line.amount = Decimal('52.00')
    >>> line = origin.lines.new()
    >>> line.amount
    Decimal('-2.00')
    >>> line.account = expense
    >>> line.description = "Bank Fees"
    >>> statement.click('post')
    >>> statement.state
    'posted'

Test statement report::

    >>> report = Report('account.statement')
    >>> _ = report.execute([statement], {})

Test copy statement::

    >>> _ = statement.duplicate()
