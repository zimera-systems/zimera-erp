# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import production, stock

__all__ = ['register']


def register():
    Pool.register(
        stock.ShipmentInReturn,
        stock.ShipmentOut,
        stock.ShipmentInternal,
        stock.ShipmentAssignedMove,
        stock.ShipmentAssignManualShow,
        stock.ShipmentUnassignManualShow,
        module='stock_assign_manual', type_='model')
    Pool.register(
        stock.ShipmentAssignManual,
        stock.ShipmentUnassignManual,
        module='stock_assign_manual', type_='wizard')
    Pool.register(
        production.Production,
        module='stock_assign_manual', type_='model', depends=['production'])
