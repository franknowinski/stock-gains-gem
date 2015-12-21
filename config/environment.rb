require 'open-uri'
require 'csv'

require "bundler"
Bundler.require 

Dir[File.join(File.dirname(__FILE__), "../lib/stock-gains", "*.rb")].each {|f| require f}
