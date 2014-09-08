# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape_press/version'

Gem::Specification.new do |spec|
  spec.name          = 'grape_press'
  spec.version       = GrapePress::VERSION
  spec.authors       = ['alexpeachey']
  spec.email         = ['alex.peachey@gmail.com']
  spec.summary       = %q{Generator for Grape API projects.}
  spec.description   = %q{Generator for Grape API projects.}
  spec.homepage      = 'https://github.com/Originate/grape_press'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.19'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
