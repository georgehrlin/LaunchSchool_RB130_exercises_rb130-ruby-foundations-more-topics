require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    path = File.expand_path('sample_text.txt', './')
    @file = File.open(path, 'r')
    @text = Text.new(@file.read)
  # @text = Text.new(File.read(path)) # One-line solution
  end

  def test_swap_replaces_a_with_e_across_entire_text
    expected = <<~TEXT.chomp
      Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
      Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
      quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
      nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
      dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
      et verius meuris, et pheretre mi.
    TEXT
    assert_equal(expected, @text.swap('a', 'e'))
  end

  def test_word_count_returns_72_for_sample_text
    assert_equal(72, @text.word_count)
  end

  # By Nick Johnson
  def test_word_count
    expected_word_count = @text.swap('', '').scan(/\w+/).size
    actual_word_count = @text.word_count
    assert_equal(expected_word_count, actual_word_count)
  end

  def teardown
    @file.close if @file && !@file.closed?
  end
end
