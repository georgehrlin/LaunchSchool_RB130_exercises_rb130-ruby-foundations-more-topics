require 'minitest/autorun'

class Test < Minitest::Test
  def test_value_is_a_Numeric
    value = 123.45
    assert_instance_of(Numeric, value) # Not assert_kind_of
  end
end
