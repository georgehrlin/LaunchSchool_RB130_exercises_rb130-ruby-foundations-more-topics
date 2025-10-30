require 'minitest/autorun'

class Test < Minitest::Test
  def test_list_is_empty1
    list = [1]
    assert_predicate(list, :empty?, 'list is not empty')
  end

  def test_list_is_empty2
    list = [2]
    assert_empty(list, 'list is not empty')
  end

  # Using assert_equal
  def test_list_is_empty3
    list = [3]
    assert_equal(true, list.empty?)
  end
end
