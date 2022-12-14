# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from trytond.pool import Pool

from . import account, account_payment, company, party, reporting_tax


def register():
    Pool.register(
        reporting_tax.PrintAEATStart,
        account.TaxCodeTemplate,
        account.TaxCode,
        account.TaxTemplate,
        account.Tax,
        account.Invoice,
        company.Company,
        party.Party,
        party.Identifier,
        reporting_tax.ESVATList,
        reporting_tax.ESVATListContext,
        reporting_tax.ECOperationList,
        reporting_tax.ECOperationListContext,
        reporting_tax.ESVATBook,
        reporting_tax.ESVATBookContext,
        module='account_es', type_='model')
    Pool.register(
        reporting_tax.AEAT111,
        reporting_tax.AEAT115,
        reporting_tax.AEAT303,
        reporting_tax.AEAT347,
        reporting_tax.AEAT349,
        reporting_tax.VATBookReport,
        module='account_es', type_='report')
    Pool.register(
        account.CreateChart,
        reporting_tax.PrintAEAT,
        module='account_es', type_='wizard')
    Pool.register(
        account_payment.Journal,
        account_payment.Group,
        module='account_es', type_='model', depends=['account_payment_sepa'])
