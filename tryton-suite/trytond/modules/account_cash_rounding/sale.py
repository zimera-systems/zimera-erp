# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from trytond.model import fields
from trytond.pool import Pool, PoolMeta
from trytond.transaction import Transaction


class Sale(metaclass=PoolMeta):
    __name__ = 'sale.sale'

    @fields.depends('company', methods=['_cash_round_total_amount'])
    def on_change_lines(self):
        pool = Pool()
        Config = pool.get('account.configuration')
        config = Config(1)
        super().on_change_lines()
        cash_rounding = config.get_multivalue(
            'cash_rounding', company=self.company.id if self.company else None)
        if cash_rounding:
            self.total_amount = self._cash_round_total_amount(
                self.total_amount)

    @classmethod
    def get_amount(cls, sales, names):
        pool = Pool()
        Config = pool.get('account.configuration')
        amounts = super().get_amount(sales, names)
        if 'total_amount' in names:
            config = Config(1)
            total_amounts = amounts['total_amount']
            for sale in sales:
                if config.get_multivalue(
                        'cash_rounding', company=sale.company.id):
                    amount = total_amounts[sale.id]
                    amount = sale._cash_round_total_amount(amount)
                    total_amounts[sale.id] = amount
        return amounts

    @fields.depends('currency', 'payment_term', 'company')
    def _cash_round_total_amount(self, amount):
        from trytond.modules.account_invoice.exceptions import (
            PaymentTermComputeError)
        pool = Pool()
        Date = pool.get('ir.date')
        if self.currency:
            amounts = [amount]
            if self.payment_term and self.company:
                with Transaction().set_company(company=self.company.id):
                    today = Date.today()
                try:
                    term_lines = self.payment_term.compute(
                        amount, self.company.currency, today)
                    amounts = [a for _, a in term_lines]
                except PaymentTermComputeError:
                    pass
            amount = sum(map(self.currency.cash_round, amounts))
        return amount
