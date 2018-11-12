require 'bigdecimal'

class Probability
  PRECISION = 5
  def initialize(probability)
    @decimal_probablity = probability.to_f
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
    other.class == self.class &&
      other.locked_precision_for_compare == locked_precision_for_compare
  end

  def hash
    locked_precision_for_compare.hash
  end

  def inspect
    "Probability(0.%d)" % locked_precision_for_compare
  end

  protected

  def locked_precision_for_compare
    @locked_precision_for_compare ||= (decimal_probablity * (10 ** PRECISION)).to_i
  end

  attr_reader :decimal_probablity
end

