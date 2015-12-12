module StockGains
end 
class StockGains::CLI

  def call
    StockGains::Portfolio.new.call
    start
  end

  def start
    input = ""
    unless input == "exit"
      begin 
        puts "\nTo view more stock information, enter the number(s)"
        puts "associated with the stock or enter 'all' to view"
        puts "all of the stocks in your portfolio."
        puts "(Separate digits with a space)\n\n"
        input = gets.strip.scan(/\w+/)
      end until valid_input?(input)
    end
  end

  def valid_input?(input)
    "all".include?(input.first) || input.map(&:to_i).all?{ |n| n.between?(1, StockGains::Stock.all.count)}
  end
end














