require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def teardown
  end

  def test_accept_money
    old = @register.total_money
    additional = 11
    @transaction.amount_paid = additional
    @register.accept_money(@transaction)
    assert_equal(old + additional, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 11
    assert_equal(1, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end
end
