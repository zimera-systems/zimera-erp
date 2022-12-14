# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from trytond.model import ModelView, fields
from trytond.pool import Pool, PoolMeta
from trytond.pyson import Eval, If
from trytond.transaction import Transaction


class PriceList(metaclass=PoolMeta):
    __name__ = 'product.price_list'

    @classmethod
    def __setup__(cls):
        super(PriceList, cls).__setup__()
        cls._buttons.update({
                'open_lines': {},
                })

    @classmethod
    @ModelView.button_action(
        'product_price_list_dates.act_price_list_line_form')
    def open_lines(cls, price_lists):
        pass

    def compute(
            self, party, product, unit_price, quantity, uom, pattern=None):
        context = Transaction().context
        pattern = pattern.copy() if pattern is not None else {}
        pattern.setdefault('date', context.get('date'))
        return super().compute(
            party, product, unit_price, quantity, uom, pattern=pattern)


class PriceListLine(metaclass=PoolMeta):
    __name__ = 'product.price_list.line'

    start_date = fields.Date(
        "Start Date",
        domain=[
            If(Eval('start_date') & Eval('end_date'),
                ('start_date', '<=', Eval('end_date')),
                ()),
            ])
    end_date = fields.Date(
        "End Date",
        domain=[
            If(Eval('start_date') & Eval('end_date'),
                ('end_date', '>=', Eval('start_date')),
                ()),
            ])

    def match(self, pattern):
        pool = Pool()
        Date = pool.get('ir.date')

        pattern = pattern.copy()
        date = pattern.pop('date', None) or Date.today()
        if self.start_date and self.start_date > date:
            return False
        if self.end_date and self.end_date < date:
            return False
        return super(PriceListLine, self).match(pattern)


class PriceListLineContext(ModelView):
    "Price List Line Context"
    __name__ = 'product.price_list.line.context'

    date = fields.Date("Date")

    @classmethod
    def default_date(cls):
        pool = Pool()
        Date = pool.get('ir.date')
        return Date.today()


class SaleContext(metaclass=PoolMeta):
    __name__ = 'product.sale.context'

    date = fields.Function(
        fields.Date("Date"),
        'on_change_with_date')

    @fields.depends('sale_date')
    def on_change_with_date(self, name=None):
        return self.sale_date
