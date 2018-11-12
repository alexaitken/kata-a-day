require_relative '../lib/probability'

RSpec.describe Probability do
  context 'limits' do
    it 'does not allow numbers larger than 1' do
      expect(Probability.new('1.0')).to be
      expect { Probability.new('1.00001') }.to raise_error(ArgumentError)
    end

    it 'does not allow numbers less than 0' do
      expect(Probability.new('0.0')).to be
      expect { Probability.new('-0.00001') }.to raise_error(ArgumentError)
    end
  end

  context 'equality' do
    it 'is equal to another probability of the same value' do
      expect(Probability.new('0.2')).to eq Probability.new('0.2')
      expect(Probability.new('0.333')).to eq Probability.new('0.333')
    end

    it 'is not equal to another probability of a different value' do
      expect(Probability.new('0.74')).to_not eq Probability.new('0.73')
    end
  end

  context 'inverse' do
    it 'is probablitiy of this not happening' do
      expect(Probability.new('0.2').inverse).to eq Probability.new('0.8')
      expect(Probability.new('0.1').inverse).to eq Probability.new('0.9')
    end
  end

  context 'combined with' do
    it 'is the the probability of the 2 events happening together' do
      expect(Probability.new('0.33').combined_with(Probability.new('0.4'))).to eq Probability.new('0.132')

    end

    it 'will compute correctly for a nummber that is hard for floating point math' do
      expect(Probability.new('0.125').combined_with(Probability.new('0.8'))).to eq Probability.new('0.1')
    end
  end

  context 'either' do
    it 'is probability of the only 1 of the 2 events happening' do
      expect(Probability.new('0.5').either(Probability.new('0.3'))).to eq Probability.new('0.65')
    end
  end
end
