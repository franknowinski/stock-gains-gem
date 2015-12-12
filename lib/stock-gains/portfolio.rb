class StockGains::Portfolio
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
    puts "Stocks in Your Portfolio".center(48)
    puts "\n"
    puts " Stock Name" + " " * 25 + "Todays +/-"
    puts " " + "-" * 45
    StockGains::Stock.all.each.with_index(1) do |stock, i|
    stock_n = stock.name.ljust(34, " ") 
      puts " #{i}. #{stock_n} $#{stock.days_value}"
    end
    puts 
  end

  def calculate_gains
    StockGains::Stock.all.each do |stock|
      @total += stock.days_value
    end
    @total = @total.round(2).to_f
  end

  def print_gains
    puts "\n"
    puts " " * 9 + ":" + "-" * 28 + ":"  
    puts " " * 9 + "|    TODAYS #{total > 0 ? "GAIN:" : "LOSS:"} $#{total} #{extra_spaces}|"
    puts " " * 9 + ":" + "-" * 28 + ":"
    puts "\n"
  end

  def extra_spaces
    " " * (9 - total.to_s.each_char.count)
  end
end