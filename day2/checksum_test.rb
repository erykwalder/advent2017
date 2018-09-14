require "minitest/autorun"
require "checksum"

class TestChecksum < Minitest::Test
  def test_checksum
    @c = Checksum.new
    input = <<EOF
5 1 9 5
7 5 3
2 4 6 8
EOF

    assert_equal 18, @c.sum(input)
  end

  def test_min_max_diff_sum
    @s = MinMaxDiffSum.new
    assert_equal 8, @s.sum("5 1 9 5")
    assert_equal 4, @s.sum("7 5 3")
    assert_equal 6, @s.sum("2 4 6 8")
  end

  def test_divisible_sum
    @s = DivisibleSum.new
    assert_equal 4, @s.sum("5 9 2 8")
    assert_equal 3, @s.sum("9 4 7 3")
    assert_equal 2, @s.sum("3 8 6 5")
  end
end
