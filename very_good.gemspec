# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'very_good/version'

Gem::Specification.new do |spec|
  spec.name          = "very_good"
  spec.version       = VeryGood::VERSION
  spec.authors       = ["Jared Norman"]
  spec.email         = ["jared@creepywizard.com"]

  spec.summary       = "VeryGood gives you a nice API so you can set what letters should be where/what colour ANSI them appear in your terminal."
  spec.description   = "VeryGood gives you a nice API so you can set what letters should be where/what colour ANSI them appear in your terminal."
  spec.homepage      = "https://github.com/jarednorman/very_good"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-stack_explorer"
end
