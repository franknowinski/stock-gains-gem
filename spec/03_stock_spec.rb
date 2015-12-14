require 'spec_helper'

describe 'StockGains::Stock' do 
  apple = StockGains::Stock.new("Apple Inc.", "113.07", "116.17", "114.94", "148.64", "112.85 - 115.39", "92.00 - 134.54", "12.28", "9.22", "30")

  describe '#initialize' do 
    it 'correctly formats a new stock instance' do 
      expect(apple.name).to eq("Apple Inc.")
      expect(apple.cur_price).to eq("113.07")
      expect(apple.prev_close).to eq("116.17")
      expect(apple.open).to eq("114.94")
      expect(apple.year_trgt).to eq("148.64")
      expect(apple.d_range).to eq("112.85 - 115.39")
      expect(apple.y_range).to eq("92.00 - 134.54")
      expect(apple.pe).to eq("12.28")
      expect(apple.eps).to eq("9.22")
      expect(apple.shares).to eq("30")
    end
  end

  describe '#calculate_days_value' do 
    it '@days_value is correctly calculated' do 
      expect(apple.days_value).to eq(-93.0) 
    end
  end

  describe '.retrieve_stock' do 
    it 'retrieves stock values from the Yahoo! Finance API' do 
      expect(StockGains::Stock.retrieve_stock(["AAPL"])).to match_array([["Apple Inc.", "113.07", "116.17", "114.94", "148.64", "112.85 - 115.39", "92.00 - 134.54", "12.28", "9.22"]])
    end
  end
end