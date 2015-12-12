class StockGains::Stock
  attr_accessor :name, :current_price, :previous_close, :open, :one_year_trgt
  attr_accessor :days_range, :year_range, :shares, :days_value

  def initialize(name, current_price, previous_close, open, one_year_trgt, days_range, year_range, shares)
    @name = name
    @current_price = current_price
    @previous_close = previous_close
    @open = open
    @one_year_trgt = one_year_trgt
    @days_range = days_range
    @year_range = year_range
    @shares = shares
    calculate_days_value
  end

  def self.all 
    @@all ||= create_stock
  end

  def calculate_days_value
    @days_value = ((self.current_price.to_f * self.shares.to_i) - (self.previous_close.to_f * self.shares.to_f)).round(2).to_f
  end

  def self.create_stock
    CSV.foreach("portfolio.csv").collect do |stock|
      s = (retrieve_stock(stock) << stock[1]).flatten
      new(s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7])
    end
  end

  def self.retrieve_stock(stock)
    url = "http://finance.yahoo.com/d/quotes.csv?s=#{stock[0]}&f=napot8mw"
    open(url) do |csv|
      CSV.parse(csv).collect{ |row| row }
    end
  end
end