module StockLookup
end 
class StockLookup::CLI
  attr_accessor :url, :appl

  def initialize
    list
  end

  def list
    puts "\n"
    puts "Stocks in Your Portfolio".center(42)
    puts " " + "-" * 40
    StockLookup::Stocks.all.each.with_index(1) do |stock, i| 
      puts " #{i}. #{stock.first} "
    end
    puts 
  end
end
