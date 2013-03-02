# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'yasify/version'

Gem::Specification.new do |s|
  s.name          = "yasify"
  s.version       = Yasify::VERSION
  s.authors       = ["lacravate"]
  s.email         = ["david.elbaz@af83.com"]
  s.homepage      = "https://github.com/lacravate/yasify"
  s.summary       = "Yet Another Stupid Idea Featuring YAML; tiny persistence interface leaning on YAML"
  s.description   = "Yet Another Stupid Idea Featuring YAML; tiny persistence interface leaning on YAML"

  s.files         = `git ls-files app lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.rubyforge_project = '[none]'

  s.add_dependency  'pathstring'

  s.add_development_dependency "rspec"
end
