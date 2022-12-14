# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool

from . import (
    configuration, invoice, ir, party, product, recurrence, service,
    subscription)


def register():
    Pool.register(
        configuration.Configuration,
        configuration.ConfigurationSequence,
        recurrence.RecurrenceRuleSet,
        recurrence.RecurrenceRule,
        recurrence.TestRecurrenceRuleSetView,
        recurrence.TestRecurrenceRuleSetViewResult,
        service.Service,
        subscription.Subscription,
        subscription.Line,
        subscription.LineConsumption,
        subscription.CreateLineConsumptionStart,
        subscription.CreateSubscriptionInvoiceStart,
        invoice.InvoiceLine,
        product.Product,
        ir.Cron,
        module='sale_subscription', type_='model')
    Pool.register(
        subscription.CreateLineConsumption,
        subscription.CreateSubscriptionInvoice,
        recurrence.TestRecurrenceRuleSet,
        party.Replace,
        party.Erase,
        module='sale_subscription', type_='wizard')
    Pool.register(
        module='sale_subscription', type_='report')
