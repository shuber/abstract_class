require_relative 'lib/abstract_class/version'

Gem::Specification.new do |s|
  s.name     = 'abstract_class'
  s.version  = AbstractClass::Version
  s.platform = Gem::Platform::RUBY

  s.summary     = 'Abstract classes in ruby'
  s.description = 'Experimental abstract classes in ruby'

  s.author   = 'Sean Huber'
  s.email    = 'github@shuber.io'
  s.homepage = 'https://github.com/shuber/abstract_class'
  s.license  = "MIT"

  s.require_paths = ['lib']

  s.files      = Dir['{bin,lib}/**/*'] + %w(LICENSE README.rdoc)
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
end
