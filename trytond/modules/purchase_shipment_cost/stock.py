# This file is part of Tryton.  The COPYRIGHT file at the top level of
# this repository contains the full copyright notices and license terms.
from decimal import ROUND_DOWN, ROUND_HALF_EVEN, Decimal
from operator import itemgetter

from trytond.model import ModelView, Workflow, fields
from trytond.modules.product import price_digits, round_price
from trytond.modules.stock_shipment_cost import ShipmentCostMixin
from trytond.pool import Pool, PoolMeta
from trytond.pyson import Eval


class ShipmentIn(ShipmentCostMixin, metaclass=PoolMeta):
    __name__ = 'stock.shipment.in'

    @fields.depends('state')
    def on_change_with_shipment_cost_readonly(self, name=None):
        return self.state != 'draft'

    @property
    def shipment_cost_moves(self):
        return [
            m for m in self.incoming_moves
            if m.state not in {'done', 'cancelled'}]

    def allocate_cost_by_value(self):
        pool = Pool()
        Currency = pool.get('currency.currency')
        Move = pool.get('stock.move')

        cost = self._get_shipment_cost()
        if not cost:
            return

        moves = self.shipment_cost_moves

        sum_value = 0
        unit_prices = {}
        for move in moves:
            unit_price = Currency.compute(move.currency, move.unit_price,
                self.company.currency, round=False)
            unit_prices[move.id] = unit_price
            sum_value += unit_price * Decimal(str(move.quantity))

        costs = []
        digit = Move.unit_price.digits[1]
        exp = Decimal(str(10.0 ** -digit))
        difference = cost
        for move in moves:
            quantity = Decimal(str(move.quantity))
            if not sum_value:
                move_cost = cost / Decimal(len(moves))
            else:
                move_cost = cost * quantity * unit_prices[move.id] / sum_value
            unit_shipment_cost = round_price(
                move_cost / quantity, rounding=ROUND_DOWN)
            costs.append({
                    'unit_shipment_cost': unit_shipment_cost,
                    'difference': move_cost - (unit_shipment_cost * quantity),
                    'move': move,
                    })
            difference -= unit_shipment_cost * quantity
        costs.sort(key=itemgetter('difference'))
        for cost in costs:
            move = cost['move']
            quantity = Decimal(str(move.quantity))
            if exp * quantity < difference:
                cost['unit_shipment_cost'] += exp
                difference -= exp * quantity
            if difference < exp:
                break

        for cost in costs:
            move = cost['move']
            unit_shipment_cost = Currency.compute(
                self.company.currency, cost['unit_shipment_cost'],
                move.currency, round=False)
            unit_shipment_cost = round_price(
                unit_shipment_cost, rounding=ROUND_HALF_EVEN)
            move.unit_price += unit_shipment_cost
            move.unit_shipment_cost = unit_shipment_cost
        Move.save(moves)

    @classmethod
    @ModelView.button
    @Workflow.transition('received')
    def receive(cls, shipments):
        Carrier = Pool().get('carrier')
        for shipment in shipments:
            shipment.cost = shipment.cost_used
            shipment.cost_currency = shipment.cost_currency_used
            if shipment.carrier:
                allocation_method = \
                    shipment.carrier.carrier_cost_allocation_method
            else:
                allocation_method = \
                    Carrier.default_carrier_cost_allocation_method()
            getattr(shipment, 'allocate_cost_by_%s' % allocation_method)()
        super(ShipmentIn, cls).receive(shipments)

    @classmethod
    @ModelView.button
    @Workflow.transition('cancelled')
    def cancel(cls, shipments):
        for shipment in shipments:
            shipment.cost = None
            shipment.cost_currency = None
        cls.save(shipments)
        super().cancel(shipments)


class Move(metaclass=PoolMeta):
    __name__ = 'stock.move'
    unit_shipment_cost = fields.Numeric(
        "Unit Shipment Cost", digits=price_digits, readonly=True,
        states={
            'invisible': ~Eval('unit_shipment_cost'),
            })

    def _compute_unit_price(self, unit_price):
        if self.unit_shipment_cost:
            unit_price -= self.unit_shipment_cost
        unit_price = super()._compute_unit_price(unit_price)
        if self.unit_shipment_cost:
            unit_price += self.unit_shipment_cost
        return unit_price

    def _compute_component_unit_price(self, unit_price):
        if self.unit_shipment_cost:
            unit_price -= self.unit_shipment_cost
        unit_price = super()._compute_component_unit_price(unit_price)
        if self.unit_shipment_cost:
            unit_price += self.unit_shipment_cost
        return unit_price

    # Split the shipment cost if account_stock_continental is activated
    def _get_account_stock_move_lines(self, type_):
        pool = Pool()
        AccountMoveLine = pool.get('account.move.line')
        Currency = pool.get('currency.currency')
        move_lines = super(Move, self)._get_account_stock_move_lines(type_)
        if (type_.startswith('in_')
                and self.unit_shipment_cost
                and self.shipment
                and self.shipment.carrier):
            shipment_cost = Currency.compute(self.currency,
                Decimal(str(self.quantity)) * self.unit_shipment_cost,
                self.company.currency)
            shipment_cost_account = \
                self.shipment.carrier.carrier_product.account_expense_used
            account = self.product.account_stock_in_used
            for move_line in move_lines:
                if move_line.account == account:
                    move_line.credit -= shipment_cost
                    shipment_cost_line = AccountMoveLine(
                        debit=Decimal('0'),
                        credit=shipment_cost,
                        account=shipment_cost_account,
                        )
                    move_lines.append(shipment_cost_line)
                    break
            else:
                raise AssertionError('missing account_stock_supplier')
        return move_lines

    # Remove shipment cost if account_stock_anglo_saxon is activated
    @classmethod
    def _get_anglo_saxon_move(cls, moves, quantity, type_):
        pool = Pool()
        Currency = pool.get('currency.currency')
        Uom = pool.get('product.uom')
        for move, qty, cost_price in super(Move, cls)._get_anglo_saxon_move(
                moves, quantity, type_):
            if (type_.startswith('in_')
                    and move.unit_shipment_cost):
                shipment_cost = Uom.compute_price(move.uom,
                    move.unit_shipment_cost, move.product.default_uom)
                shipment_cost = Currency.compute(move.currency,
                    shipment_cost, move.company.currency)
                cost_price -= shipment_cost
            yield move, qty, cost_price
