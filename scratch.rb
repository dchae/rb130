# in scratch.rb
require "minitest/autorun"

class MyFirstTest < Minitest::Test
  def test_first_test
    p x = rand(2)
    x.odd?
  end
end
