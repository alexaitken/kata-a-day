require 'rspec-benchmark'
require_relative '../lib/probability'

RSpec.configure do |config|
  config.include RSpec::Benchmark::Matchers
end

