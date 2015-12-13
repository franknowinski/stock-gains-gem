class StockGains::StockLookup
  attr_accessor :tickers

  def initialize
    @tickers = []
  end

  def call
    input = "" 
    loop do
      puts "To view stocks not included in your portfolio, enter the stock ticker(s)"
      puts "separated by a space.\n\n"
      input = gets.strip.downcase
      break if input == "e" || input == "exit" || input == ""
      tickers << input.strip.scan(/\S[a-zA-Z]+/).join("+").upcase
      StockGains::CLI.new.print_stock_info(retreive_stock_info(tickers))
      tickers.clear
    end
  end
  
  def retreive_stock_info(tickers)
    StockGains::Stock.retrieve_stock(tickers).collect do |s|
      StockGains::Stock.new(s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7], s[8], s[9])
    end
  end
end 