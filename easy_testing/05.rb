require 'minitest/autorun'

class Test < Minitest::Test
  def test_list_includes_xyz1
    list = [1, 'xyz']
    assert_includes(list, 'xyz')
  end

  # By Bob Rodes
  def test_list_includes_xyz2
    list = [2, 'xy']
    refute_nil(list.index('xyz'))
  end
end
