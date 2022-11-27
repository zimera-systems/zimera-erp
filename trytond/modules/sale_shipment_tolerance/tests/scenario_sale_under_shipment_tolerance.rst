======================================
Sale Under Shipment Tolerance Scenario
======================================

Imports::

    >>> from decimal import Decimal
    >>> from proteus import Model, Wizard
    >>> from trytond.tests.tools import activate_modules
    >>> from trytond.modules.company.tests.tools import create_company, \
    ...     get_company
    >>> from trytond.modules.account.tests.tools import create_chart, \
    ...     get_accounts

Activate modules::

    >>> config = activate_modules('sale_shipment_tolerance')

Create company::

    >>> _ = create_company()
    >>> company = get_company()

Create chart of accounts::

    >>> _ = create_chart(company)
    >>> accounts = get_accounts(company)
    >>> revenue = accounts['revenue']

Create parties::

    >>> Party = Model.get('party.party')
    >>> customer = Party(name='Customer')
    >>> customer.save()

Create account category::

    >>> ProductCategory = Model.get('product.category')
    >>> account_category = ProductCategory(name="Account Category")
    >>> account_category.accounting = True
    >>> account_category.account_revenue = revenue
    >>> account_category.save()

Create product::

    >>> ProductUom = Model.get('product.uom')
    >>> unit, = ProductUom.find([('name', '=', 'Unit')])
    >>> ProductTemplate = Model.get('product.template')
    >>> template = ProductTemplate()
    >>> template.name = 'product'
    >>> template.default_uom = unit
    >>> template.type = 'goods'
    >>> template.salable = True
    >>> template.list_price = Decimal('10')
    >>> template.account_category = account_category
    >>> template.save()
    >>> product, = template.products

Set tolerance::

    >>> Configuration = Model.get('sale.configuration')
    >>> config = Configuration(1)
    >>> config.sale_under_shipment_tolerance = 0.9
    >>> config.save()

Sale 10 products::

    >>> Sale = Model.get('sale.sale')
    >>> sale = Sale()
    >>> sale.party = customer
    >>> sale_line = sale.lines.new()
    >>> sale_line.product = product
    >>> sale_line.quantity = 10
    >>> sale.click('quote')
    >>> sale.click('confirm')
    >>> sale.click('process')

Under ship 5 products::

    >>> shipment, = sale.shipments
    >>> move, = shipment.inventory_moves
    >>> move.quantity = 5
    >>> shipment.click('assign_force')
    >>> shipment.click('pick')
    >>> shipment.click('pack')
    >>> shipment.click('done')

Under ship 4 products::

    >>> sale.reload()
    >>> _, shipment = sale.shipments
    >>> move, = shipment.inventory_moves
    >>> move.quantity = 4
    >>> shipment.click('assign_force')
    >>> shipment.click('pick')
    >>> shipment.click('pack')
    >>> shipment.click('done')

No new shipment as shipped inside tolerance::

    >>> sale.reload()
    >>> len(sale.shipments)
    2
    >>> sale.shipment_state
    'sent'
