# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tree_config/version'

Gem::Specification.new do |spec|
  spec.name          = "tree_config"
  spec.version       = TreeConfig::VERSION
  spec.authors       = ["huydx"]
  spec.email         = ["doxuanhuy@gmail.com"]
  spec.summary       = %q{Rails config store gem}
  spec.description   = %q{Rails config store gem used for project has complex config structure}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0'
  
  spec.add_dependency "activesupport", ">=3.0"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
