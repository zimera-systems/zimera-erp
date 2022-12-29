# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from proteus import Model

from trytond.modules.company.tests.tools import get_company


def add_cogs_accounts(accounts, company=None, config=None):
    "Add COGS to accounts"
    Account = Model.get('account.account', config=config)

    if not company:
        company = get_company(config=config)

    accounts['cogs'], = Account.find([
            ('type.expense', '=', True),
            ('id', '!=', accounts['expense'].id),
            ('company', '=', company.id),
            ])
    return accounts
