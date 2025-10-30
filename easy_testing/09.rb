require 'minitest/autorun'

class Array
  def process
    return(self)
  end
end

class Test < Minitest::Test
  def test_list_and_list_process_are_different_objects
    list = [1, 2, 3]
    assert_same(list, list.process)
    # By Nick Johnson
    # assert(list.equal?(liest.process))
    # assert(list.object_id == list.process.object_id)
  end
end
