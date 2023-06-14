require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def teardown
  end

  def test_accept_money
    old = @register.total_money
    additional = 10
    @transaction.amount_paid = additional
    @register.accept_money(@transaction)
    assert_equal(@register.total_money, old + additional)
  end
end
