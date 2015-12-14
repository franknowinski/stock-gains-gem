# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stock-gains/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Frank Nowinski"]
  spec.email         = ["nowinski.frank@gmail.com"]
  spec.description   = %q{Stock gains}
  spec.summary       = %q{Stock gains}
  spec.homepage      = "https://learn.co"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["stock-gains"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "stock-gains-gem"
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