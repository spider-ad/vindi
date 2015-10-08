# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vindi/version'

Gem::Specification.new do |spec|
  spec.name          = "vindi"
  spec.version       = Vindi::VERSION
  spec.authors       = ["Lennon Manchester"]
  spec.email         = ["le.manchester@gmail.com"]
  spec.summary       = 'Ruby bindings for the Vindi API'
  spec.description   = 'Ruby gem to interact with Vindi payment gateway'
  spec.homepage      = "https://www.vindi.com.br/"
  spec.license       = "MIT"

  spec.add_development_dependency('bundler', '~> 1.7')
  spec.add_development_dependency('rake', '~> 10.4.2')

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

end
