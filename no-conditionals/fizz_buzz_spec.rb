require_relative 'fizz_buzz'

RSpec.describe FizzBuzz do
  it 'returns the number for everything not divisible by 3, 5, or 7' do
    expect(subject.convert(1)).to eq '1'
    expect(subject.convert(2)).to eq '2'
    expect(subject.convert(37)).to eq '37'
  end

  it 'returns fizz for numbers divisible by only' do
    expect(subject.convert(3)).to eq 'fizz'
    expect(subject.convert(6)).to eq 'fizz'
    expect(subject.convert(66)).to eq 'fizz'
  end

  it 'returns buzz for numbers divisible by only 5' do
    expect(subject.convert(10)).to eq 'buzz'
    expect(subject.convert(40)).to eq 'buzz'
    expect(subject.convert(95)).to eq 'buzz'
  end

  it 'returns fizzbuzz for numbers divisible by only 3 and 5' do
    expect(subject.convert(30)).to eq 'fizzbuzz'
    expect(subject.convert(45)).to eq 'fizzbuzz'
    expect(subject.convert(90)).to eq 'fizzbuzz'
  end

  it 'returns zap for the number 7' do
    expect(subject.convert(7)).to eq 'zap'
  end

  it 'returns zap for numbers divisible by only 7' do
    expect(subject.convert(7)).to eq 'zap'
    expect(subject.convert(28)).to eq 'zap'
    expect(subject.convert(56)).to eq 'zap'
  end

  it 'returns fizzzap for numbers divisible by only 3 and 7' do
    expect(subject.convert(21)).to eq 'fizzzap'
    expect(subject.convert(42)).to eq 'fizzzap'
  end

  it 'returns buzzzap for numbers divisible by only 5 and 7' do
    expect(subject.convert(35)).to eq 'buzzzap'
    expect(subject.convert(70)).to eq 'buzzzap'
  end
end
