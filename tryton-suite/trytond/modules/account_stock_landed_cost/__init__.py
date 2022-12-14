# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import account, product, stock


def register():
    Pool.register(
        product.Template,
        product.Product,
        account.Configuration,
        account.ConfigurationLandedCostSequence,
        account.LandedCost,
        account.LandedCost_Shipment,
        account.LandedCost_ProductCategory,
        account.LandedCost_Product,
        account.LandedCostShow,
        account.LandedCostShowMove,
        account.InvoiceLine,
        stock.Move,
        module='account_stock_landed_cost', type_='model')
    Pool.register(
        account.PostLandedCost,
        account.ShowLandedCost,
        module='account_stock_landed_cost', type_='wizard')
