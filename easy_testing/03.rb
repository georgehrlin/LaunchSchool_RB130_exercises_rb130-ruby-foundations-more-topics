require 'minitest/autorun'

class Test < Minitest::Test
  def test_value_is_nil
    value = 'something'
    assert_nil(value, 'value is not nil')
  end
end

# By Nick Johnson
# assert_predicate(value, :nil?)
