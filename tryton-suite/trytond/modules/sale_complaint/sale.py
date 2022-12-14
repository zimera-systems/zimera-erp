# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond import backend
from trytond.model import fields
from trytond.pool import Pool, PoolMeta
from trytond.pyson import Eval, Id


class Configuration(metaclass=PoolMeta):
    __name__ = 'sale.configuration'

    complaint_sequence = fields.MultiValue(fields.Many2One(
            'ir.sequence', "Complaint Sequence", required=True,
            domain=[
                ('sequence_type', '=',
                    Id('sale_complaint', 'sequence_type_complaint')),
                ('company', 'in', [
                        Eval('context', {}).get('company', -1), None]),
                ]))

    @classmethod
    def multivalue_model(cls, field):
        pool = Pool()
        if field == 'complaint_sequence':
            return pool.get('sale.configuration.sequence')
        return super(Configuration, cls).multivalue_model(field)

    @classmethod
    def default_complaint_sequence(cls, **pattern):
        return cls.multivalue_model(
            'complaint_sequence').default_complaint_sequence()


class ConfigurationSequence(metaclass=PoolMeta):
    __name__ = 'sale.configuration.sequence'
    complaint_sequence = fields.Many2One(
        'ir.sequence', "Complaint Sequence", required=True,
        domain=[
            ('sequence_type', '=',
                Id('sale_complaint', 'sequence_type_complaint')),
            ('company', 'in', [Eval('company', -1), None]),
            ])

    @classmethod
    def __register__(cls, module_name):
        exist = backend.TableHandler.table_exist(cls._table)
        if exist:
            table = cls.__table_handler__(module_name)
            exist &= table.column_exist('complaint_sequence')

        super(ConfigurationSequence, cls).__register__(module_name)

        if not exist:
            cls._migrate_property([], [], [])

    @classmethod
    def _migrate_property(cls, field_names, value_names, fields):
        field_names.append('complaint_sequence')
        value_names.append('complaint_sequence')
        super(ConfigurationSequence, cls)._migrate_property(
            field_names, value_names, fields)

    @classmethod
    def default_complaint_sequence(cls):
        pool = Pool()
        ModelData = pool.get('ir.model.data')
        try:
            return ModelData.get_id('sale_complaint', 'sequence_complaint')
        except KeyError:
            return None


class Sale(metaclass=PoolMeta):
    __name__ = 'sale.sale'

    @classmethod
    def _get_origin(cls):
        return super(Sale, cls)._get_origin() + ['sale.complaint']
