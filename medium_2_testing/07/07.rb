require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(500)
    @transaction = Transaction.new(40)
  end

  def test_prompt_for_payment
    before_amount_paid = @transaction.amount_paid
    payment_amount = StringIO.new("40\n")
    @transaction.prompt_for_payment(input: payment_amount)
    after_amount_paid = @transaction.amount_paid

    assert_equal(before_amount_paid + 40, after_amount_paid)
  end
end