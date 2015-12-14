# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stock-gains/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Frank Nowinski"]
  spec.email         = ["nowinski.frank@gmail.com"]
  spec.description   = %q{This Ruby gem uses the Yahoo Finance API to provide three valuable stock market functions for the user. First, it imports the users portoflio from a CSV file, calculates each stocks earnings/losses for the day, then returns the total balance your portfolio has earned/lost. Next, it gives the user the option to display generic stock information of any or all of the stocks in their portfolio. Lastly, it allows the user to lookup stock data of any stock(s) of their choosing (see https://github.com/frankNowinski/stock-gains-gem).}
  spec.summary       = %q{https://github.com/frankNowinski/stock-gains-gem}
  spec.homepage      = "https://learn.co"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["stock-gains"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "stock-gains"
  spec.require_paths = ["lib", "lib/stock-gains"]
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