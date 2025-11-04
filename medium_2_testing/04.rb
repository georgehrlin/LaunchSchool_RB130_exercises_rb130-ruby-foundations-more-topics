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

  def test_change
    @transaction.amount_paid = 50
    assert_equal(10, @register.change(@transaction))
  end
end
