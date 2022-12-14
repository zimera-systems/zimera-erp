# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from trytond.model import fields
from trytond.pool import PoolMeta
from trytond.pyson import Eval


class Line(metaclass=PoolMeta):
    __name__ = 'purchase.line'

    work = fields.Many2One(
        'project.work', "Work Effort",
        domain=[
            ('company', '=', Eval('_parent_purchase', {}).get('company', -1)),
            ],
        states={
            'invisible': Eval('type') != 'line',
            },
        depends={'purchase'},
        help="Add to the cost of the work effort.")
