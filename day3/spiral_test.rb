require "minitest/autorun"
require "spiral"

class TestSpiral < Minitest::Test
  def test_spiral
    @s = Spiral.new
    assert_equal 0, @s.distance(1)
    assert_equal 1, @s.distance(2)
    assert_equal 2, @s.distance(3)
    assert_equal 2, @s.distance(23)
    assert_equal 31, @s.distance(1024)
  end
end
