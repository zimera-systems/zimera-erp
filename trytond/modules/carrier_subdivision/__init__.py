# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import carrier, sale

__all__ = ['register']


def register():
    Pool.register(
        carrier.Selection,
        module='carrier_subdivision', type_='model')
    Pool.register(
        sale.Sale,
        module='carrier_subdivision', type_='model',
        depends=['sale_shipment_cost'])
    Pool.register(
        sale.Carriage,
        module='carrier_subdivision', type_='model',
        depends=['carrier_carriage', 'sale_shipment_cost'])
