module StockLookup
end 
class StockLookup::CLI
  attr_accessor :total

  def initialize
    @total = 0
  end

  def call
    list
    calculate_gains
    print_gains
  end

  def list
    puts "\n"
    puts "Stocks in Your Portfolio".center(42)
    puts " " + "-" * 38
    StockLookup::Stocks.all.each.with_index(1) do |stock, i| 
      puts " #{i}. #{stock.name}"
    end
    puts 
  end

  def calculate_gains
    StockLookup::Stocks.all.each do |s|
      @total += (s.current_price.to_f * s.shares.to_i) - (s.previous_close.to_f * s.shares.to_f)
    end
    @total = @total.round(2).to_f 
  end

  def print_gains
    puts "\n"
    puts " " * 5 + ":" + "-" * 28 + ":"  
    puts " " * 5 + "|    TODAYS #{total > 0 ? "GAIN:" : "LOSS:"} $#{total} #{extra_spaces}|"
    puts " " * 5 + ":" + "-" * 28 + ":"
    puts "\n"
  end

  def extra_spaces
    " " * (9 - total.to_s.each_char.count)
  end
end

