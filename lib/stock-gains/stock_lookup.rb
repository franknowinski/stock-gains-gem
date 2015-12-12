class StockGains::StockLookup
  attr_accessor :tickers

  def initialize
    @tickers = []
  end

  def call
    get_tickers
    retreive_stock_info
  end

  def get_tickers
    puts "\nIf you'd like to see stock data concerning stock(s) not included in your"
    puts "portfolio, enter the stock ticker(s) separated by a space.\n\n"
    tickers << gets.strip.scan(/\S[a-zA-Z]+/).join("+").upcase 
    exit if tickers.include?("EXIT") || tickers.first == ""
  end

  def retreive_stock_info
    StockGains::Stock.retrieve_stock(tickers).collect do |s|
      StockGains::Stock.new(s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7], s[8], s[9])
    end
  end
end