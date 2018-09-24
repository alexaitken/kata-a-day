class FizzBuzz
  LOOKUP = {
    'fizzbuzz' => {
      by_3: true,
      by_5: true,
      by_7: false
    },
    'fizz' => {
      by_3: true,
      by_5: false,
      by_7: false
    },
    'buzz' => {
      by_3: false,
      by_5: true,
      by_7: false
    },
    'zap' => {
      by_3: false,
      by_5: false,
      by_7: true
    },
    'fizzzap' => {
      by_3: true,
      by_5: false,
      by_7: true
    },
    'buzzzap' => {
      by_3: false,
      by_5: true,
      by_7: true
    },
  }.invert.freeze

  def convert(input)
    LOOKUP.fetch(lookup_key(input), input.to_s)
  end

  private

  def lookup_key(input)
    {
      by_3: input % 3 == 0,
      by_5: input % 5 == 0,
      by_7: input % 7 == 0,
    }
  end
end
