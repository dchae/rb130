require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "text"

class TextTest < Minitest::Test
  def setup
    @f = File.new("sample_text.txt", "r")
    @sample_text = @f.read
    @text = Text.new(@sample_text)
  end

  def teardown
    @f.close
    puts "File has been closed: #{@f.closed?}"
  end

  def test_swap
    swapped = @text.swap("a", "e")
    expected = <<~EXPECTED.chomp
      Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
      Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
      quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
      nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
      dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
      et verius meuris, et pheretre mi.
    EXPECTED

    assert_equal(expected, swapped)
  end

  def test_word_count
    count = @text.word_count
    assert_equal(72, count)
  end
end
