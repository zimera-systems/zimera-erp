# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from trytond.pool import PoolMeta
from trytond.transaction import Transaction


class Invoice(metaclass=PoolMeta):
    __name__ = 'account.invoice'

    @classmethod
    def __setup__(cls):
        super(Invoice, cls).__setup__()
        add_remove = [
            ('invoice', '=', None),
        ]

        if not cls.lines.add_remove:
            cls.lines.add_remove = add_remove
        else:
            cls.lines.add_remove = [
                add_remove,
                cls.lines.add_remove,
                ]


class InvoiceLine(metaclass=PoolMeta):
    __name__ = 'account.invoice.line'

    @classmethod
    def parse_view(cls, tree, type, *args, **kwargs):
        if type == 'form' and Transaction().context.get('standalone'):
            tree_root = tree.getroottree().getroot()
            if tree_root.get('cursor') == 'product':
                tree_root.set('cursor', 'party')
        return super().parse_view(tree, type, *args, **kwargs)
