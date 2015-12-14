require 'pry'
require 'open-uri'
require 'csv'

Dir[File.join(File.dirname(__FILE__), "stock-gains", "*.rb")].each {|f| require f}

module StockGains
end