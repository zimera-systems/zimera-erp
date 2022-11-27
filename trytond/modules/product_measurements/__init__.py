# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import product


def register():
    Pool.register(
        product.Template,
        product.Product,
        module='product_measurements', type_='model')
