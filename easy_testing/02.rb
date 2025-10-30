require 'minitest/autorun'

class Test < Minitest::Test
  def test_downcase
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end
