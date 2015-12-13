module StockGains 
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
        puts "(Separate digits with a space to view multiple stocks)"
        puts "(Enter 'e' at anytime throughout the program to exit)\n\n"
        input = gets.strip.scan(/\w+/)
      end until valid_input?(input) || input.first == "e"
      
      if input.first != "e"   
        input.first == "all" ? find_all : find(input)
        stock_lookup
      end
      puts "\nGoodbye!"
    end

    def valid_input?(input)
      input.first == "all" || input.map(&:to_i).all?{ |n| n.between?(1, StockGains::Stock.all.count)}
    end

    def find_all
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
      StockGains::StockLookup.new.call
    end
  end
end