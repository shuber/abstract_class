# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'abstract_class/version'
require 'date'

Gem::Specification.new do |s|
  s.name     = 'abstract_class'
  s.version  = AbstractClass::Version.string
  s.date     = Date.today
  s.platform = Gem::Platform::RUBY

  s.summary     = 'Abstract classes in ruby'
  s.description = 'Abstract classes in ruby'

  s.author   = 'Sean Huber'
  s.email    = 'shuber@huberry.com'
  s.homepage = 'http://github.com/shuber/abstract_class'

  s.has_rdoc     = true
  s.rdoc_options = ['--line-numbers', '--inline-source', '--main', 'README.rdoc']

  s.require_paths = ['lib']

  s.files      = Dir['{bin,lib}/**/*'] + %w(MIT-LICENSE README.rdoc)
  s.test_files = Dir['test/**/*']
end