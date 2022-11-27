# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import carrier, stock


def register():
    Pool.register(
        stock.PackageType,
        stock.Package,
        stock.ShipmentOut,
        stock.ShipmentInReturn,
        carrier.CredentialUPS,
        carrier.Carrier,
        module='stock_package_shipping_ups', type_='model')
    Pool.register(
        stock.CreateShipping,
        stock.CreateShippingUPS,
        module='stock_package_shipping_ups', type_='wizard')
