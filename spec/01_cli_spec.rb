require 'spec_helper'

describe 'StockGains::CLI' do 
  cli = StockGains::CLI.new

  describe 'instance' do 
    it 'creates an instance' do 
      expect(cli).to be_an_instance_of(StockGains::CLI)  
    end 
  end

  describe '#valid_input?' do
    it 'is true when the input is "all"' do
      expect(cli.valid_input?(["all"])).to be_truthy
    end 

    it 'is true when the input values are valid' do
      expect(cli.valid_input?(["1, 2, 3"])).to be_truthy
    end

    it 'is false when the input is invalid' do 
      expect(cli.valid_input?(["0"])).to be_falsey
      expect(cli.valid_input?(["none"])).to be_falsey
    end
  end
end