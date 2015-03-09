require File.expand_path('../lib/abstract_class/version', __FILE__)

Gem::Specification.new do |s|
  s.author           = 'Sean Huber'
  s.description      = 'An implementation of the "abstract class" design pattern in Ruby'
  s.email            = 'github@shuber.io'
  s.extra_rdoc_files = %w(LICENSE)
  s.files            = `git ls-files`.split("\n")
  s.homepage         = 'https://github.com/shuber/abstract_class'
  s.license          = 'MIT'
  s.name             = 'abstract_class'
  s.rdoc_options     = %w(--charset=UTF-8 --inline-source --line-numbers --main README.md)
  s.require_paths    = %w(lib)
  s.summary          = 'Abstract classes in Ruby'
  s.test_files       = `git ls-files -- spec/*`.split("\n")
  s.version          = AbstractClass::VERSION

  s.add_development_dependency 'rspec'
end
