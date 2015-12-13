require 'spec_helper'

describe 'StockGains::Portfolio' do 
  portfolio = StockGains::Portfolio.new

  describe '#initialize' do 
    it 'instantiates @total to 0' do
      expect(portfolio).to respond_to(:total)  
    end 

    it '@total is set to 0 ' do
      expect(portfolio.total).to eq(0)  
    end 
  end
end