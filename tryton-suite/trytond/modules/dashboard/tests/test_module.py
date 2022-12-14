# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.

from trytond.pool import Pool
from trytond.tests.test_tryton import ModuleTestCase, with_transaction


class DashboardTestCase(ModuleTestCase):
    'Test Dashboard module'
    module = 'dashboard'

    @with_transaction()
    def test_view_read(self):
        'Test dashboard view read'
        pool = Pool()
        View = pool.get('ir.ui.view')
        dashboard_id = View.dashboard_id()
        result, = View.read([dashboard_id], ['arch'])
        self.assertIn('board', result['arch'])


del ModuleTestCase
