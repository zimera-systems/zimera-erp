==================================================
Purchase Blanket Agreement Secondary Unit Scenario
==================================================

Imports::

    >>> import datetime
    >>> from dateutil.relativedelta import relativedelta
    >>> from decimal import Decimal

    >>> from proteus import Model, Wizard
    >>> from trytond.tests.tools import activate_modules
    >>> from trytond.modules.company.tests.tools import (
    ...     create_company, get_company)
    >>> from trytond.modules.account.tests.tools import (
    ...     create_chart, get_accounts)

    >>> today = datetime.date.today()
    >>> later = today + relativedelta(days=30)


Activate modules::

    >>> config = activate_modules([
    ...         'purchase_secondary_unit', 'purchase_blanket_agreement'])

    >>> Party = Model.get('party.party')
    >>> ProductCategory = Model.get('product.category')
    >>> ProductUom = Model.get('product.uom')
    >>> ProductTemplate = Model.get('product.template')
    >>> PurchaseBlanketAgreement = Model.get('purchase.blanket_agreement')

Create company::

    >>> _ = create_company()
    >>> company = get_company()

Create chart of accounts::

    >>> _ = create_chart(company)
    >>> accounts = get_accounts(company)

Create supplier::

    >>> supplier = Party(name="Supplier")
    >>> supplier.save()

Create account category::

    >>> account_category = ProductCategory(name="Account Category")
    >>> account_category.accounting = True
    >>> account_category.account_expense = accounts['expense']
    >>> account_category.account_revenue = accounts['revenue']
    >>> account_category.save()

Create product::

    >>> unit, = ProductUom.find([('name', '=', 'Unit')])
    >>> gr, = ProductUom.find([('name', '=', 'Gram')])
    >>> template = ProductTemplate()
    >>> template.name = "Product"
    >>> template.default_uom = unit
    >>> template.type = 'goods'
    >>> template.list_price = Decimal('10.000')
    >>> template.purchasable = True
    >>> template.account_category = account_category
    >>> template.purchase_secondary_uom = gr
    >>> template.purchase_secondary_uom_factor = 100
    >>> template.save()
    >>> product, = template.products
    >>> product.cost_price = Decimal('8.000')
    >>> product.save()

Create purchase blanket agreement::

    >>> blanket_agreement = PurchaseBlanketAgreement()
    >>> blanket_agreement.supplier = supplier
    >>> blanket_agreement.from_date = today
    >>> blanket_agreement.to_date = later
    >>> blanket_agreement_line = blanket_agreement.lines.new()
    >>> blanket_agreement_line.product = product
    >>> blanket_agreement_line.quantity = 800.0
    >>> blanket_agreement_line.unit = gr
    >>> blanket_agreement_line.unit_price = Decimal('7.000')
    >>> blanket_agreement.click('run')
    >>> blanket_agreement.state
    'running'

Create purchase from blanket agreement::

    >>> create_purchase = Wizard(
    ...     'purchase.blanket_agreement.create_purchase', [blanket_agreement])
    >>> create_purchase.form.lines[0].unit == gr
    True
    >>> create_purchase.execute('create_purchase')

    >>> purchase, = create_purchase.actions[0]
    >>> line, = purchase.lines
    >>> line.product == product
    True

    >>> line.secondary_unit == gr
    True
    >>> line.secondary_quantity
    800.0
    >>> line.secondary_unit_price
    Decimal('7.0000')

    >>> line.unit == unit
    True
    >>> line.quantity
    8.0
    >>> line.unit_price
    Decimal('700.0000')

    >>> line.secondary_quantity = 300.0
    >>> purchase.save()

    >>> blanket_agreement.reload()
    >>> blanket_agreement_line, = blanket_agreement.lines
    >>> blanket_agreement_line.remaining_quantity
    800.0

Confirm purchase::

    >>> purchase.click('quote')
    >>> purchase.click('confirm')
    >>> purchase.state
    'processing'

    >>> blanket_agreement_line.reload()
    >>> blanket_agreement_line.remaining_quantity
    500.0
