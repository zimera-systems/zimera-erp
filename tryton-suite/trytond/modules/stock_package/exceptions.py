# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.exceptions import UserError
from trytond.model.exceptions import ValidationError


class PackageError(UserError):
    pass


class PackageValidationError(ValidationError):
    pass
