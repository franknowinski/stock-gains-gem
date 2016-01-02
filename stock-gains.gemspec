# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stock-gains/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Frank Nowinski"]
  spec.email         = ["nowinski.frank@gmail.com"]
  spec.description   = %q{This Ruby gem uses the Yahoo Finance API to provide three valuable stock market functions for the user. First, it imports the users portfolio from a CSV file, calculates each stocks earnings/losses of the day, adds them together and returns an accumulated balance of the users total earnings/losses for the day. Next, it gives the user the option to display generic stock information of any or all stocks in their portfolio. Lastly, it allows the user to lookup stock data of any stock, or stocks, of their choosing (for more information see https://github.com/frankNowinski/stock-gains).}
  spec.summary       = %q{https://github.com/frankNowinski/stock-gains}
  spec.homepage      = "https://learn.co"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["stock-gains"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "stock-gains"
  spec.require_paths = ["lib", "lib/stock_gains"]
  spec.version       = StockGains::VERSION
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end