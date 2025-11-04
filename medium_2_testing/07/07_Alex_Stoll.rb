require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def test_prompt_for_payment
    input = StringIO.new('20\n')
    capture_io { @transaction.prompt_for_payment(input: input) }
    assert_equal(20, @transaction.amount_paid)
  end
end

=begin
Notes
In the case with this test file, transaction.rb would not need to be changed.

capture_io "is meant to capture $stdout and $stderr into strings".
=end
