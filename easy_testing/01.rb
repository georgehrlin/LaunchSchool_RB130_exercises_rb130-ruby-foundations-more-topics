require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

class OddTest < Minitest::Test
  def test_odd1
    assert_equal(true, 5.odd?, '5 is odd')
  end

  def test_odd2
    assert_equal(false, 4.odd?, '4 is not odd')
  end
end

# Official Solution
# assert(value.odd?, 'value is not odd')
