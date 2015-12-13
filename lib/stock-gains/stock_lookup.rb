class StockGains::StockLookup
  attr_accessor :tickers

  def retreive_stock_info(tickers)
    StockGains::Stock.retrieve_stock(tickers).collect do |s|
      StockGains::Stock.new(s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7], s[8], s[9])
    end
  end
end 