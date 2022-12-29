# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
import base64
import datetime
import logging

import requests

from trytond.config import config
from trytond.i18n import gettext
from trytond.model import ModelSQL, ModelView, Unique, fields
from trytond.model.exceptions import AccessError
from trytond.modules.company.model import CompanyValueMixin
from trytond.pool import Pool, PoolMeta
from trytond.pyson import Bool, Eval, If
from trytond.transaction import Transaction

from .exceptions import InvoiceChorusValidationError

CERT = (
    config.get('account_fr_chorus', 'certificate'),
    config.get('account_fr_chorus', 'privatekey'))
BASE_URL = config.get(
    'account_fr_chorus', 'url', default='https://chorus-pro.gouv.fr:5443')
EDOC2SYNTAX = {
    'edocument.uncefact.invoice': 'IN_DP_E1_CII_16B',
    }
EDOC2FILENAME = {
    'edocument.uncefact.invoice': 'UNCEFACT-%s.xml',
    }
TIMEOUT = config.getfloat('account_fr_chorus', 'requests_timeout', default=300)
logger = logging.getLogger(__name__)


class _SyntaxMixin(object):
    __slots__ = ()

    @classmethod
    def get_syntaxes(cls):
        pool = Pool()
        syntaxes = [(None, "")]
        try:
            doc = pool.get('edocument.uncefact.invoice')
        except KeyError:
            pass
        else:
            syntaxes.append((doc.__name__, "CII"))
        return syntaxes


class Configuration(_SyntaxMixin, metaclass=PoolMeta):
    __name__ = 'account.configuration'

    _states = {
        'required': Bool(Eval('chorus_login')),
        }

    chorus_login = fields.MultiValue(fields.Char("Chorus Login", strip=False))
    chorus_password = fields.MultiValue(fields.Char(
            "Chorus Password", strip=False, states=_states))
    chorus_service = fields.MultiValue(fields.Selection([
                (None, ""),
                ('service-qualif', "Qualification"),
                ('service', "Production"),
                ], "Chorus Service", states=_states))
    chorus_syntax = fields.Selection(
        'get_syntaxes', "Chorus Syntax", states=_states)

    del _states

    @classmethod
    def multivalue_model(cls, field):
        pool = Pool()
        if field in {'chorus_login', 'chorus_password', 'chorus_service'}:
            return pool.get('account.credential.chorus')
        return super(Configuration, cls).multivalue_model(field)


class CredentialChorus(ModelSQL, CompanyValueMixin):
    "Account Credential Chorus"
    __name__ = 'account.credential.chorus'

    chorus_login = fields.Char("Login", strip=False)
    chorus_password = fields.Char("Password", strip=False)
    chorus_service = fields.Selection([
            (None, ""),
            ('service-qualif', "Qualification"),
            ('service', "Production"),
            ], "Service")

    @classmethod
    def post(cls, path, payload):
        pool = Pool()
        Configuration = pool.get('account.configuration')
        config = Configuration(1)
        url = '/'.join((BASE_URL, config.chorus_service, path))
        auth = (config.chorus_login, config.chorus_password)
        resp = requests.post(
            url, json=payload, cert=CERT, verify=True, auth=auth,
            timeout=TIMEOUT)
        resp.raise_for_status()
        return resp.json()


class Invoice(metaclass=PoolMeta):
    __name__ = 'account.invoice'

    @classmethod
    def _post(cls, invoices):
        pool = Pool()
        InvoiceChorus = pool.get('account.invoice.chorus')
        posted_invoices = {
            i for i in invoices if i.state in {'draft', 'validated'}}
        super()._post(invoices)
        invoices_chorus = []
        for invoice in posted_invoices:
            if invoice.type == 'out' and invoice.party.chorus:
                invoices_chorus.append(InvoiceChorus(invoice=invoice))
        InvoiceChorus.save(invoices_chorus)


class InvoiceChorus(ModelSQL, ModelView, _SyntaxMixin, metaclass=PoolMeta):
    "Invoice Chorus"
    __name__ = 'account.invoice.chorus'

    invoice = fields.Many2One(
        'account.invoice', "Invoice", required=True,
        domain=[
            ('type', '=', 'out'),
            ('state', 'in', If(Bool(Eval('number')),
                    ['posted', 'paid'],
                    ['posted'])),
            ])
    syntax = fields.Selection('get_syntaxes', "Syntax", required=True)
    number = fields.Char("Number", readonly=True, strip=False)
    date = fields.Date("Date", readonly=True)

    @classmethod
    def __setup__(cls):
        super(InvoiceChorus, cls).__setup__()

        t = cls.__table__()
        cls._sql_constraints = [
            ('invoice_unique', Unique(t, t.invoice),
                'account_fr_chorus.msg_invoice_unique'),
            ]

    @classmethod
    def default_syntax(cls):
        pool = Pool()
        Configuration = pool.get('account.configuration')
        config = Configuration(1)
        return config.chorus_syntax

    @classmethod
    def validate(cls, records):
        super(InvoiceChorus, cls).validate(records)
        for record in records:
            addresses = [
                record.invoice.company.party.address_get('invoice'),
                record.invoice.invoice_address]
            for address in addresses:
                if not address.siret:
                    raise InvoiceChorusValidationError(
                        gettext('account_fr_chorus'
                            '.msg_invoice_address_no_siret',
                            invoice=record.invoice.rec_name,
                            address=address.rec_name))

    @classmethod
    def delete(cls, records):
        for record in records:
            if record.number:
                raise AccessError(
                    gettext('account_fr_chorus.msg_invoice_delete_sent',
                        invoice=record.invoice.rec_name))
        super(InvoiceChorus, cls).delete(records)

    def _send_context(self):
        return {
            'company': self.invoice.company.id,
            }

    @classmethod
    def send(cls, records=None):
        """Send invoice to Chorus

        The transaction is committed after each invoice.
        """
        pool = Pool()
        Credential = pool.get('account.credential.chorus')
        transaction = Transaction()

        if not records:
            records = cls.search(['OR',
                    ('number', '=', None),
                    ('number', '=', ''),
                    ('invoice.company', '=',
                        transaction.context.get('company')),
                    ])

        cls.lock(records)
        for record in records:
            # Use clear cache after a commit
            record = cls(record.id)
            record.lock()
            with Transaction().set_context(**record._send_context()):
                payload = record.get_payload()
                resp = Credential.post('factures/deposer/flux', payload)
                if resp['codeRetour']:
                    logger.error(
                        "Error when sending invoice %d to chorus: %s",
                        record.id, resp['libelle'])
                else:
                    record.number = resp['numeroFluxDepot']
                    record.date = datetime.datetime.strptime(
                        resp['dateDepot'], '%Y-%m-%d').date()
                    record.save()
            Transaction().commit()

    def get_payload(self):
        pool = Pool()
        Doc = pool.get(self.syntax)
        with Transaction().set_context(account_fr_chorus=True):
            data = Doc(self.invoice).render(None)
        filename = EDOC2FILENAME[self.syntax] % self.invoice.number
        filename = filename.replace('/', '-')
        return {
            'fichierFlux': base64.b64encode(data).decode('ascii'),
            'nomFichier': filename,
            'syntaxeFlux': EDOC2SYNTAX[self.syntax],
            'avecSignature': False,
            }
