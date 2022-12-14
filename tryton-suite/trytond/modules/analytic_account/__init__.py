# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import account, line, rule
from .account import AnalyticMixin

__all__ = [AnalyticMixin]


def register():
    Pool.register(
        account.Account,
        account.AccountDistribution,
        account.AccountContext,
        account.AnalyticAccountEntry,
        line.Line,
        line.Move,
        line.MoveLine,
        rule.Rule,
        module='analytic_account', type_='model')
    Pool.register(
        line.OpenAccount,
        module='analytic_account', type_='wizard')
