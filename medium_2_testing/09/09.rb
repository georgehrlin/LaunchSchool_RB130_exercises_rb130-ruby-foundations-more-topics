require 'minitest/autorun'

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @original_text_string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.\n" \
                            "Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat\n" \
                            "quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo\n" \
                            "nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum\n" \
                            "dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras\n" \
                            "et varius mauris, at pharetra mi."
    @sample_text_file = File.new('sample_text.txt')
    @sample_text = Text.new(@sample_text_file.read)
  end

  def test_swap
    assert_equal(@original_text_string.gsub('a', 'e'), @sample_text.swap('a', 'e'))
  end

  def teardown
    @sampel_text_file.close
  end
end

=begin
Notes from LSBot Review
* It's best to move @original_text_string into test_swap because it is used by
  only this one test and that keeps setup focused on preparing shared state.
* "Use a path relative to the test file so the test doesn't depend on the
  current working directory." 
  * path = File.join(dir, 'sample_text.txt') # => [current directory]/sample_text.txt
  * @sample_text_file = File.open(path, 'r')
=end
