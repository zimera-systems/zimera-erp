======================
Stock Package Scenario
======================

Imports::

    >>> import datetime
    >>> from dateutil.relativedelta import relativedelta
    >>> from decimal import Decimal
    >>> from proteus import Model, Wizard
    >>> from trytond.tests.tools import activate_modules
    >>> from trytond.exceptions import UserError
    >>> from trytond.modules.company.tests.tools import create_company, \
    ...     get_company
    >>> today = datetime.date.today()

Activate modules::

    >>> config = activate_modules('stock_package')

Create company::

    >>> _ = create_company()
    >>> company = get_company()

Create customer::

    >>> Party = Model.get('party.party')
    >>> customer = Party(name='Customer')
    >>> customer.save()

Create product::

    >>> ProductUom = Model.get('product.uom')
    >>> ProductTemplate = Model.get('product.template')
    >>> unit, = ProductUom.find([('name', '=', 'Unit')])

    >>> template = ProductTemplate()
    >>> template.name = 'Product'
    >>> template.default_uom = unit
    >>> template.type = 'goods'
    >>> template.list_price = Decimal('20')
    >>> template.save()
    >>> product, = template.products

Get stock locations::

    >>> Location = Model.get('stock.location')
    >>> warehouse_loc, = Location.find([('code', '=', 'WH')])
    >>> supplier_loc, = Location.find([('code', '=', 'SUP')])
    >>> customer_loc, = Location.find([('code', '=', 'CUS')])
    >>> output_loc, = Location.find([('code', '=', 'OUT')])
    >>> storage_loc, = Location.find([('code', '=', 'STO')])

Create Shipment Out::

    >>> ShipmentOut = Model.get('stock.shipment.out')
    >>> shipment_out = ShipmentOut()
    >>> shipment_out.planned_date = today
    >>> shipment_out.customer = customer
    >>> shipment_out.warehouse = warehouse_loc
    >>> shipment_out.company = company

Add two shipment lines of same product::

    >>> StockMove = Model.get('stock.move')
    >>> shipment_out.outgoing_moves.extend([StockMove(), StockMove()])
    >>> for move in shipment_out.outgoing_moves:
    ...     move.product = product
    ...     move.uom =unit
    ...     move.quantity = 1
    ...     move.from_location = output_loc
    ...     move.to_location = customer_loc
    ...     move.company = company
    ...     move.unit_price = Decimal('1')
    ...     move.currency = company.currency
    >>> shipment_out.save()

Pack shipment::

    >>> shipment_out.click('wait')
    >>> shipment_out.click('assign_force')
    >>> shipment_out.click('pick')

Package products::

    >>> PackageType = Model.get('stock.package.type')
    >>> box = PackageType(name='box')
    >>> box.packaging_length = 80
    >>> box.packaging_length_uom, = ProductUom.find([('name', '=', "Centimeter")])
    >>> box.packaging_width = 1
    >>> box.packaging_width_uom, = ProductUom.find([('name', '=', "Meter")])
    >>> box.packaging_height_uom = box.packaging_length_uom
    >>> box.packaging_volume
    >>> box.packaging_volume_uom, = ProductUom.find([('name', '=', "Cubic meter")])
    >>> box.save()
    >>> package1 = shipment_out.packages.new(type=box)
    >>> package1.packaging_length
    80.0
    >>> package1.packaging_height = 50
    >>> package1.packaging_volume
    0.4
    >>> package_child = package1.children.new(shipment=shipment_out, type=box)
    >>> package_child.packaging_height = 100
    >>> moves = package_child.moves.find()
    >>> len(moves)
    2
    >>> package_child.moves.append(moves[0])

    >>> shipment_out.save()  # doctest: +IGNORE_EXCEPTION_DETAIL
    Traceback (most recent call last):
        ...
    PackageValidationError: ...

    >>> package1.packaging_height = 120
    >>> package1.packaging_volume
    0.96

    >>> shipment_out.click('pack')  # doctest: +IGNORE_EXCEPTION_DETAIL
    Traceback (most recent call last):
        ...
    PackageError: ...

    >>> package2 = shipment_out.packages.new(type=box)
    >>> moves = package2.moves.find()
    >>> len(moves)
    1
    >>> package2.moves.append(moves[0])

    >>> shipment_out.click('pack')
