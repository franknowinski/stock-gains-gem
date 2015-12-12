module StockGains
end 
class StockGains::CLI

  def call
    StockGains::Portfolio.new.call
    start
  end

  def start

  end

end