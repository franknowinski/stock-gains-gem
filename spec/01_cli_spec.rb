require 'spec_helper'

describe 'StockGains::CLI' do 
  klass = StockGains::CLI.new
  apple = StockGains::Stock.new("Apple Inc.", "113.07", "116.17", "114.94", "148.64", "112.85 - 115.39", "92.00 - 134.54", "12.28", "9.22", " 30")

  describe '.instance' do 
    it 'creates an instance' do 
      expect(klass).to be_an_instance_of(StockGains::CLI)  
    end 
  end

  describe '#valid_input?' do
    it 'is true when the input is "all"' do
      expect(klass.valid_input?(["all"])).to be(true)
    end 

    it 'is true when the input values are valid' do
      expect(klass.valid_input?(["1, 2, 3"])).to be(true)
    end
  end
end