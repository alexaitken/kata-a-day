class FizzBuzz
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def say
    result = Hash.new('')

    result[:value] += 'fizz' if number % 3 == 0
    result[:value] += 'buzz' if number % 5 == 0

    result.fetch(:value, number.to_s)
  end
end
