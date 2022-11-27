=====================================
Account ES EC Operation List Scenario
=====================================

Imports::

    >>> from decimal import Decimal
    >>> from proteus import Model, Wizard
    >>> from trytond.tests.tools import activate_modules
    >>> from trytond.modules.company.tests.tools import (
    ...     create_company, get_company)
    >>> from trytond.modules.account.tests.tools import (
    ...     create_chart, get_accounts, create_fiscalyear)
    >>> from trytond.modules.account_invoice.tests.tools import \
    ...     set_fiscalyear_invoice_sequences

Activate modules::

    >>> config = activate_modules('account_es')

Create company::

    >>> _ = create_company()
    >>> company = get_company()
    >>> tax_identifier = company.party.identifiers.new()
    >>> tax_identifier.type = 'eu_vat'
    >>> tax_identifier.code = 'ESB01000009'
    >>> company.party.save()

Create fiscal year::

    >>> fiscalyear = set_fiscalyear_invoice_sequences(
    ...     create_fiscalyear(company))
    >>> fiscalyear.click('create_period')
    >>> period = fiscalyear.periods[0]

Create chart of accounts::

    >>> _ = create_chart(company, 'account_es.pgc_0_pyme')
    >>> accounts = get_accounts(company)
    >>> expense = accounts['expense']
    >>> revenue = accounts['revenue']

Create party::

    >>> Party = Model.get('party.party')
    >>> TaxRule = Model.get('account.tax.rule')
    >>> tax_rule, = TaxRule.find([
    ...         ('company', '=', company.id),
    ...         ('kind', '=', 'purchase'),
    ...         ('name', '=', 'Compras Intracomunitarias'),
    ...     ])
    >>> party = Party(name='Intracomunitary Supplier')
    >>> party.supplier_tax_rule = tax_rule
    >>> tax_identifier = party.identifiers.new()
    >>> tax_identifier.type = 'eu_vat'
    >>> tax_identifier.code = 'BE0897290877'
    >>> party.save()

Create account category::

    >>> Tax = Model.get('account.tax')
    >>> tax, = Tax.find([
    ...         ('company', '=', company.id),
    ...         ('group.kind', '=', 'purchase'),
    ...         ('name', '=', 'IVA 21% (bienes)'),
    ...     ])
    >>> ProductCategory = Model.get('product.category')
    >>> account_category = ProductCategory(name="Account Category")
    >>> account_category.accounting = True
    >>> account_category.account_expense = expense
    >>> account_category.account_revenue = revenue
    >>> account_category.supplier_taxes.append(tax)
    >>> account_category.save()

Create product::

    >>> ProductUom = Model.get('product.uom')
    >>> unit, = ProductUom.find([('name', '=', 'Unit')])
    >>> ProductTemplate = Model.get('product.template')
    >>> template = ProductTemplate()
    >>> template.name = 'product'
    >>> template.default_uom = unit
    >>> template.type = 'service'
    >>> template.list_price = Decimal('40')
    >>> template.account_category = account_category
    >>> template.save()
    >>> product, = template.products

Create invoice::

    >>> Invoice = Model.get('account.invoice')
    >>> invoice = Invoice()
    >>> invoice.type = 'in'
    >>> invoice.party = party
    >>> invoice.invoice_date = period.start_date
    >>> line = invoice.lines.new()
    >>> line.product = product
    >>> line.quantity = 5
    >>> line.unit_price = Decimal('40')
    >>> invoice.click('post')

Operation appears in report::

    >>> ECOperationList = Model.get('account.reporting.es_ec_operation_list')
    >>> context = {
    ...     'company': company.id,
    ...     'start_date': period.start_date,
    ...     'end_date': period.end_date,
    ...     }
    >>> with config.set_context(context):
    ...     record, = ECOperationList.find([])

Cancel invoice::

    >>> invoice.click('cancel')

Operation does not appear in report::

    >>> with config.set_context(context):
    ...     ECOperationList.find([])
    []

Create another invoice::

    >>> invoice = Invoice()
    >>> invoice.type = 'in'
    >>> invoice.party = party
    >>> invoice.invoice_date = period.start_date
    >>> line = invoice.lines.new()
    >>> line.product = product
    >>> line.quantity = 5
    >>> line.unit_price = Decimal('40')
    >>> invoice.click('post')

Refund invoice::

    >>> credit = Wizard('account.invoice.credit', [invoice])
    >>> credit.form.with_refund = True
    >>> credit.form.invoice_date = invoice.invoice_date
    >>> credit.execute('credit')
    >>> invoice.reload()

Operation appears in report with amount zero::

    >>> with config.set_context(context):
    ...     record, = ECOperationList.find([])
    >>> record.amount == Decimal('0.0')
    True
