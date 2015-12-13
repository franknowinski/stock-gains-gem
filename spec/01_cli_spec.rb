require 'spec_helper'

describe 'StockGains::CLI' do 
  klass = StockGains::CLI.new

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

    it 'is false when the input is invalid' do 
      expect(klass.valid_input?(["0"])).to be(false)
      expect(klass.valid_input?(["none"])).to be(false)
    end
  end
end