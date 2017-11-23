# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/rspec/focused/version'

Gem::Specification.new do |spec|
  spec.name          = "rubocop-rspec-focused"
  spec.version       = RuboCop::RSpec::Focused::VERSION
  spec.authors       = ["Love With Food, Hendy Tanata"]
  spec.email         = ["hendy@lovewithfood.com"]
  spec.summary       = %q{RuboCop extension to find focused specs}
  spec.description   = %q{Find focused specs}
  spec.homepage      = "https://github.com/lovewithfood/rubocop-rspec-focused"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rubocop", ">= 0.51"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
end
