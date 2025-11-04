require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(50)
    transaction.amount_paid = 50
    assert_equal(150, cash_register.accept_money(transaction))
  end
end

# Official Solution
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = reister.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(previous_amount + 20, current_amount)
  end
