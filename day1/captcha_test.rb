require "minitest/autorun"
require "captcha"

class TestCaptcha < Minitest::Test
  def test_challenge_next_matcher
    @c = Captcha.new
    assert_equal 3, @c.challenge("1122")
    assert_equal 4, @c.challenge("1111")
    assert_equal 0, @c.challenge("1234")
    assert_equal 9, @c.challenge("91212129")
  end

  def test_challenge_half_matcher
    @c = Captcha.new(HalfMatcher.new)
    assert_equal 6, @c.challenge("1212") 
    assert_equal 0, @c.challenge("1221") 
    assert_equal 4, @c.challenge("123425") 
    assert_equal 12, @c.challenge("123123") 
    assert_equal 4, @c.challenge("12131415") 
  end
end
