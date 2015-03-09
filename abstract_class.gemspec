require File.expand_path('../lib/abstract_class/version', __FILE__)

Gem::Specification.new do |s|
  s.name     = 'abstract_class'
  s.version  = AbstractClass::VERSION
  s.platform = Gem::Platform::RUBY

  s.summary     = 'Abstract classes in ruby'
  s.description = 'An implementation of the "abstract class" pattern in ruby'

  s.author   = 'Sean Huber'
  s.email    = 'github@shuber.io'
  s.homepage = 'https://github.com/shuber/abstract_class'
  s.license  = 'MIT'

  s.require_paths = ['lib']

  s.files      = Dir['{bin,lib}/**/*'] + %w(LICENSE README.rdoc)
  s.test_files = Dir['spec/**/*']

  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'rspec'
end
