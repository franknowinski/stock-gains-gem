require_relative '../lib/stock-lookup/cli'

describe 'CLI' do 
  let(:stocks){StockLookup::CLI.new}

  describe '#negative?' do 
    it 'has a negative? instance method' do 
      expect(stocks).to respond_to(:negative?)
    end

    it 'returns an empty space ("") if the stocks current price is greater than the previous close' do
      current_price = "116.38"
      previous_close = "115.62"

      expect(stocks.negative?(current_price, previous_close)).to eq('')
    end

    it 'returns a negative character ("-") if the stocks current price is less than the previous close' do
      current_price = "115.60"
      previous_close = "115.62"
      
      expect(stocks.negative?(current_price, previous_close)).to eq('-')
    end
  end
end