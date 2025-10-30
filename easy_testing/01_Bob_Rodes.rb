# Bare minimum code for a test
require 'minitest/autorun'

class Test < Minitest::Test
  def test_ # test (without underscore) does not work
    value = 3
    assert(value.odd?, 'value is not odd')
  end
end
