require 'spec_helper'

describe 'StockGains::StockLookup' do 
  stock_lookup = StockGains::StockLookup.new

  describe '#initialize' do 
    it 'has an attribute to store stock tickers' do
      expect(stock_lookup.tickers).to match_array([])
    end
  end
end