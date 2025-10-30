require 'minitest/autorun'

class Test < Minitest::Test
  def test_is_value_a_kind_of_Numeric
    value = 123.45
    assert_kind_of(Numeric, value)
    # By Max Lebo
    # assert(value.class <= Numeric)
  end
end
