require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text.rb'

class TextTest < Minitest::Test
  def setup
    path = File.join(dir, sample_text.txt)
    @file = File.open(dir, 'r')
    @text = Text.new(@file.read)
  end

  def test_swap
    swapped_text = @text.swap('a', 'e')
    assert_nil(swapped_text.gsub!('a', 'e')) # gsub! returns nil when nothing's been changed
  end

  def teardown
    @file.close
  end
end
