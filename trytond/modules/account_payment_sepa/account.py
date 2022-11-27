# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from trytond import backend
from trytond.model import ModelSQL, fields
from trytond.modules.company.model import CompanyValueMixin
from trytond.pool import PoolMeta
from trytond.pyson import Eval, Id
from trytond.tools.multivalue import migrate_property


class Configuration(metaclass=PoolMeta):
    __name__ = 'account.configuration'
    sepa_mandate_sequence = fields.MultiValue(fields.Many2One(
            'ir.sequence', "SEPA Mandate Sequence",
            domain=[
                ('sequence_type', '=', Id(
                        'account_payment_sepa', 'sequence_type_mandate')),
                ('company', 'in', [Eval('context', {}).get('company', -1),
                        None]),
                ]))


class ConfigurationSepaMandateSequence(ModelSQL, CompanyValueMixin):
    "Account Configuration SEPA Mandate Sequence"
    __name__ = 'account.configuration.sepa_mandate_sequence'
    sepa_mandate_sequence = fields.Many2One(
        'ir.sequence', "SEPA Mandate Sequence",
        domain=[
            ('sequence_type', '=', Id(
                    'account_payment_sepa', 'sequence_type_mandate')),
            ('company', 'in', [Eval('company', -1), None]),
            ])

    @classmethod
    def __register__(cls, module_name):
        exist = backend.TableHandler.table_exist(cls._table)

        super(ConfigurationSepaMandateSequence, cls).__register__(module_name)

        if not exist:
            cls._migrate_property([], [], [])

    @classmethod
    def _migrate_property(cls, field_names, value_names, fields):
        field_names.append('sepa_mandate_sequence')
        value_names.append('sepa_mandate_sequence')
        fields.append('company')
        migrate_property(
            'account.configuration', field_names, cls, value_names,
            fields=fields)
