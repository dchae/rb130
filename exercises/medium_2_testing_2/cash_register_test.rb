require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(15)
  end

  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(15)
    transaction.amount_paid = 15

    initial_register_balance = register.total_money
    register.accept_money(transaction)

    assert_equal(115, register.total_money)
    assert_equal(initial_register_balance + transaction.amount_paid, register.total_money)
  end

  def test_change
    @transaction.amount_paid = 16
    assert_equal(1, @register.change(@transaction))
  end
end
