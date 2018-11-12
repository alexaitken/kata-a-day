require 'bigdecimal'

class Probability
  def initialize(probability)
    @decimal_probablity = BigDecimal.new(probability)
    raise ArgumentError, 'probabilities can not be more than 1.0' if @decimal_probablity > 1
    raise ArgumentError, 'probabilities can not be more than 0.0' if @decimal_probablity < 0

  end

  def inverse
    self.class.new(1 - decimal_probablity)
  end

  def combined_with(other)
    self.class.new(other.decimal_probablity * decimal_probablity)
  end

  def either(other)
    new_probability = other.decimal_probablity + decimal_probablity - other.decimal_probablity * decimal_probablity
    self.class.new(new_probability)
  end

  def ==(other)
    other.class == self.class && other.decimal_probablity == decimal_probablity
  end

  def hash
    decimal_probablity.hash
  end

  def inspect
    "Probability('#{decimal_probablity}')"
  end

  protected

  attr_reader :decimal_probablity
end

