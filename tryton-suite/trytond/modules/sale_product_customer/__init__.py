# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import product, sale

__all__ = ['register']


def register():
    Pool.register(
        product.Template,
        product.Product,
        product.ProductCustomer,
        sale.Line,
        module='sale_product_customer', type_='model')
    Pool.register(
        sale.AmendmentLine,
        module='sale_product_customer', type_='model',
        depends=['sale_amendment'])
    Pool.register(
        sale.LineBlanketAgreement,
        sale.BlanketAgreementLine,
        module='sale_product_customer', type_='model',
        depends=['sale_blanket_agreement'])
    Pool.register(
        module='sale_product_customer', type_='wizard')
    Pool.register(
        module='sale_product_customer', type_='report')
