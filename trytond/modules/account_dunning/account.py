# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from trytond.model import ModelSQL, ValueMixin, fields
from trytond.pool import PoolMeta

default_dunning_procedure = fields.Many2One(
    'account.dunning.procedure', "Default Dunning Procedure",
    help="The default dunning procedure for new customers.")


class Configuration(metaclass=PoolMeta):
    __name__ = 'account.configuration'
    default_dunning_procedure = fields.MultiValue(default_dunning_procedure)


class ConfigurationDefaultDunningProcedure(ModelSQL, ValueMixin):
    "Account Configuration Default Dunning Procedure"
    __name__ = 'account.configuration.default_dunning_procedure'
    default_dunning_procedure = default_dunning_procedure


class MoveLine(metaclass=PoolMeta):
    __name__ = 'account.move.line'

    dunnings = fields.One2Many('account.dunning', 'line', 'Dunnings')

    @property
    def dunning_procedure(self):
        if self.party:
            return self.party.dunning_procedure

    @classmethod
    def copy(cls, lines, default=None):
        if default is None:
            default = {}
        else:
            default = default.copy()
        default.setdefault('dunnings', None)
        return super(MoveLine, cls).copy(lines, default=default)
