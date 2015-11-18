# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_attributes/version'

Gem::Specification.new do |spec|
  spec.name          = "string_attributes"
  spec.version       = StringAttributes::VERSION
  spec.authors       = ["syguer"]
  spec.email         = ["ksk.i.530@gmail.com"]

  spec.summary       = %q{String utility for ActiveRecord}
  spec.description   = %q{Add string utility to model of ActiveRecord}
  spec.homepage      = "https://github.com/syguer/string_attributes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 4.0"
  spec.add_dependency "activesupport", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
