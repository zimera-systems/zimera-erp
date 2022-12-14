# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import stock

__all__ = ['register']


def register():
    Pool.register(
        stock.Configuration,
        stock.ConfigurationMeasurement,
        stock.Move,
        stock.ShipmentIn,
        stock.ShipmentInReturn,
        stock.ShipmentOut,
        stock.ShipmentOutReturn,
        module='stock_shipment_measurements', type_='model')
    Pool.register(
        stock.Package,
        stock.ShipmentOutPackage,
        stock.ShipmentInReturnPackage,
        module='stock_shipment_measurements', type_='model',
        depends=['stock_package'])
    Pool.register(
        module='stock_shipment_measurements', type_='wizard')
    Pool.register(
        module='stock_shipment_measurements', type_='report')
