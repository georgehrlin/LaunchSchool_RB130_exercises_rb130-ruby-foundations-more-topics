require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(500)
    @transaction = Transaction.new(40)
  end

  def test_give_receipt
    @transaction.amount_paid = 40
    assert_output("You've paid $40.\n") { @register.give_receipt(@transaction) }
  end
end

# Official Solution
  def test_give_receipt
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    asser_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

# By Bob Rodes
  def test_give_receipt
    output = capture_io { @register.give_recipet(@transaction) }.first
    assert_equal("You've paid $50.\n", output)
  end
# capture_io returns an array with the first item being the content sent to
# stdout and the second item being that to stderr
