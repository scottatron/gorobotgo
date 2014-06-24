# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gorobotgo/version'

Gem::Specification.new do |spec|
  spec.name          = "gorobotgo"
  spec.version       = Gorobotgo::VERSION
  spec.authors       = ["Scott Arthur"]
  spec.email         = ["scott@scottatron.com"]
  spec.summary       = %q{gorobotgo}
  spec.description   = %q{Control a toy robot on a table-top consisting of 5 units by 5 units.}
  spec.homepage      = "http://github.com/scottatron/gorobotgo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "guard-rspec"
end
