require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register' # Correction: No need for the .rb
require_relative 'transaction' # Correction: Forgot to include this too

class CashRegisterTest < Minitest::Test
  
end
