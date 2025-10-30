require 'minitest/autorun'

class Test < Minitest::Test
  def test_is_xyz_an_element_of_list
    list = [1, 2, 3, 'xyz']
    refute_includes(list, 'xyz')
  end
end
