class StockLookup::Stocks
  attr_accessor :name, :current_price, :previous_close, :shares

  def initialize(name=nil, current_price=nil, previous_close=nil, shares=nil)
    @name = name
    @current_price = current_price
    @previous_close = previous_close
    @shares = shares
  end

  def self.all 
    @@all ||= read_stocks_from_csv
  end

  def self.read_stocks_from_csv
    CSV.foreach("portfolio.csv").collect do |stock|
      s = (create_stock(stock) << stock[1]).flatten
      new(s[0], s[1], s[2], s[3])
    end
  end

  def self.create_stock(stock)
    url = "http://finance.yahoo.com/d/quotes.csv?s=#{stock[0]}&f=nap"

    open(url) do |csv|
      CSV.parse(csv).collect{ |row| row }
    end
  end
end



# 3494.4 / 3468.6


