require 'pry-byebug'
require 'stringio'

require_relative 'cash_register'
require_relative 'transaction'

register = CashRegister.new(500)
transaction = Transaction.new(40)

pay = StringIO.new("40\n")
puts "Amount paid before: #{transaction.amount_paid}"
#binding.pry
transaction.prompt_for_payment(input: pay)
puts "Amount paid after: #{transaction.amount_paid}"
