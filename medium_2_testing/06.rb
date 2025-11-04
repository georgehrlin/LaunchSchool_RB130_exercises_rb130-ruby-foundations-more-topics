require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
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

=begin
Notes
$stdin represents the standard input stream, which is usually the keyboard.
More specifically, it is a global variable that Ruby uses to represent the
default source of input.

StringIO is Ruby's the string stream class that Ruby provides. We can create a
StringIO object that mocks the user input.
=end
