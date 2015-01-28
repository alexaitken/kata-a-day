class FizzBuzz
  TRANSLATIONS = {
    'fizz' => 3,
    'buzz' => 5
  }.freeze

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def say
    result = TRANSLATIONS.reduce('') do |memo, (word, divisor)|
      memo += word if number % divisor == 0
      memo
    end

    result.empty? ? number.to_s : result
  end
end
