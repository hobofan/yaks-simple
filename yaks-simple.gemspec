# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaks/simple/version'

Gem::Specification.new do |spec|
  spec.name          = "yaks-simple"
  spec.version       = Yaks::Simple::VERSION
  spec.authors       = ["Maximilian Goisser"]
  spec.email         = ["goisser94@gmail.com"]
  spec.summary       = %q{Simple JSON Format that ignores most of yaks features.}
  spec.description   = %q{Simple JSON Format that ignores most of yaks features.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "yaks", "~> 0.9"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
