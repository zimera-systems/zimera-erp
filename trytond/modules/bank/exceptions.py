# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.model.exceptions import ValidationError


class IBANValidationError(ValidationError):
    pass


class InvalidBIC(ValidationError):
    pass


class AccountValidationError(ValidationError):
    pass
