require 'minitest/autorun'
require 'fizz_buzz'

class FizzBuzzTest < Minitest::Unit::TestCase
  def test_get_the_number_back_for_1
    assert_equal '1', FizzBuzz.new(1).say
  end

  def test_get_the_number_back_for_2
    assert_equal '2', FizzBuzz.new(2).say
  end

  def test_numbers_divisible_by_3_turn_into_fizz
    assert_equal 'fizz', FizzBuzz.new(3).say
  end

  def test_numbers_divisible_by_5_turn_into_buzz
    assert_equal 'buzz', FizzBuzz.new(5).say
  end

  def test_numbers_divisible_by_5_and_3_turn_into_fizzbuzz
    assert_equal 'fizzbuzz', FizzBuzz.new(30).say
  end
end
