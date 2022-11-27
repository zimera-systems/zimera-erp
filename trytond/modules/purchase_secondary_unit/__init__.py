# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import account, product, purchase, stock

__all__ = ['register']


def register():
    Pool.register(
        account.InvoiceLine,
        product.Template,
        product.Product,
        product.ProductSupplier,
        purchase.Line,
        stock.Move,
        module='purchase_secondary_unit', type_='model')
    Pool.register(
        purchase.RequisitionLine,
        module='purchase_secondary_unit', type_='model',
        depends=['purchase_requisition'])
    Pool.register(
        purchase.BlanketAgreementLine,
        purchase.LineBlanketAgreement,
        module='purchase_secondary_unit', type_='model',
        depends=['purchase_blanket_agreement'])
