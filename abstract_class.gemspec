# -*- encoding: utf-8 -*-

require_relative 'lib/abstract_class/version'
require 'date'

Gem::Specification.new do |s|
  s.name     = 'abstract_class'
  s.version  = AbstractClass::Version
  s.date     = Date.today
  s.platform = Gem::Platform::RUBY

  s.summary     = 'Abstract classes in ruby'
  s.description = 'Abstract classes in ruby'

  s.author   = 'Sean Huber'
  s.email    = 'github@shuber.io'
  s.homepage = 'http://github.com/shuber/abstract_class'

  s.require_paths = ['lib']

  s.files      = Dir['{bin,lib}/**/*'] + %w(LICENSE README.rdoc)
  s.test_files = Dir['test/**/*']
  s.license    = "MIT"

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
end
