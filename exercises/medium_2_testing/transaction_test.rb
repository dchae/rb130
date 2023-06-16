require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

# require 'simplecov'
# SimpleCov.start

require_relative "transaction"

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(10)
  end

  def test_prompt_for_payment_method
    assert_equal(0, @transaction.amount_paid)
    cost = @transaction.item_cost
    test_input = StringIO.new("#{2.times.map { |i| cost - 1 + i }.join("\n")}")
    expected_output = <<~E_OUTPUT
      You owe $#{cost}.
      How much are you paying?
      That is not the correct amount. Please make sure to pay the full cost.
      You owe $#{cost}.
      How much are you paying?
      E_OUTPUT

    # assert_output(expected_output) do
    #   @transaction.prompt_for_payment(input: test_input)
    #   test_input.close
    # end

    # the below lines are relatively equivalent to the above commented-out lines
    test_output = StringIO.new
    $stdout = test_output
    @transaction.prompt_for_payment(input: test_input)
    $stdout = STDOUT
    test_output.rewind
    assert_equal(expected_output, test_output.read)
    test_output.close

    assert_instance_of(Float, @transaction.amount_paid)
    assert_equal(cost, @transaction.amount_paid)
  end
end
