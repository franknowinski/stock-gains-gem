module StockGains
end 
class StockGains::CLI

  def call
    StockGains::Portfolio.new.call
    start
  end

  def start
    input = ""
    begin 
      puts "\nTo view more stock information, enter the number associated with"
      puts "the stock or enter 'all' to view all of the stocks in your portfolio."
      puts "(Separate digits with a space to view multiple stocks)\n\n"
      input = gets.strip.scan(/\w+/)
    end until input == [] || valid_input?(input) || input.first == "exit"
    exit if input.first == "exit" 
    
    input.first == "all" ? find_all(input) : find(input)
    stock_lookup
    puts "Goodbye!"
  end

  def valid_input?(input)
    input.first == "all" || input.map(&:to_i).all?{ |n| n.between?(1, StockGains::Stock.all.count)}
  end

  def find_all(stocks)
    print_stock_info(StockGains::Stock.all)
  end

  def find(stock)
    print_stock_info(stock.map(&:to_i).collect{ |s| StockGains::Stock.all[s-1] })
  end

  def print_stock_info(stocks)
    puts "\n"
    stocks.each do |stock|
      puts "#{stock.name}".center(66)
      puts " " + "-" * 66
      puts " Asking Price:     $#{stock.cur_price}".ljust(35, " ") + "Day's Range:    $#{stock.d_range}"
      puts " Previous Close:   $#{stock.prev_close}".ljust(35, " ") + "52 Week Range:  $#{stock.y_range}"
      puts " Open:             $#{stock.open}".ljust(35, " ") + "1 Year Target:  $#{stock.year_trgt}"
      puts " P/E Ratio:        $#{stock.pe}".ljust(35, " ") + "EPS:            $#{stock.eps}"
      puts " Day's +/-:        $#{stock.days_value}".ljust(35, " ") + "Shares:        #{stock.shares}"
      puts "\n\n"
    end
  end

  def stock_lookup
    print_stock_info(StockGains::StockLookup.new.call)
    puts "Would you like to lookup another stock? ('y' or 'yes')"
    answer = gets.strip.downcase
    self.stock_lookup if answer == "y" || answer == "yes"
  end
end