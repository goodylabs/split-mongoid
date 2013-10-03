# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'split-mongoid/version'

Gem::Specification.new do |gem|
  gem.name          = "split-mongoid"
  gem.version       = Split::Mongoid::VERSION
  gem.authors       = ["Chris Winslett"]
  gem.email         = ["chris@mongohq.com"]
  gem.description   = %q{A Mongoid Persistence Layer for Split}
  gem.summary       = %q{Use Mongoid for your persistence layer when working with split}
  gem.homepage      = "http://github.com/mongohq/split-mongoid"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "mongoid", '> 3.0.0'
  gem.add_dependency "split", '~> 0.6.0'
  gem.add_dependency "activesupport", ">= 3.2.11"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rspec-mocks"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "guard-bundler"
  gem.add_development_dependency 'rb-fsevent', '~> 0.9.1'
end
