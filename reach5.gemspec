# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "reach5/version"

Gem::Specification.new do |spec|
  spec.name          = "reach5"
  spec.version       = Reach5::VERSION
  spec.authors       = ["Sunny Ripert"]
  spec.email         = ["sunny@sunfox.org"]

  spec.summary       = "Integrate to Reach5"
  spec.description   = "Integrate to the Reach5 Customer Identity Management " \
                       "Platform"
  spec.homepage      = "http://github.com/sunny/reach5"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
                                        .reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http", "4.4.1"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.89.0"
  spec.add_development_dependency "webmock", "~> 3.6"
end
