# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sugoi_bulk_insert/version'

Gem::Specification.new do |spec|
  spec.name          = "sugoi_bulk_insert"
  spec.version       = SugoiBulkInsert::VERSION
  spec.authors       = ["jiikko"]
  spec.email         = ["n905i.1214@gmail.com"]

  spec.summary       = %q{bulk insert without ActiveRecord.}
  spec.description   = %q{ bulk insert without ActiveRecord.}
  spec.homepage      = "https://github.com/jiikko/sugoi_bulk_insert"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "mysql2"
end
