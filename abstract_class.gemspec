require 'date'
require 'lib/abstract_class/version'

Gem::Specification.new do |s| 
  s.name    = 'abstract_class'
  s.version = Interface::Version.string
  s.date    = Date.today.to_s

  s.summary     = 'Abstract classes in ruby'
  s.description = 'Abstract classes in ruby'

  s.author   = 'Sean Huber'
  s.email    = 'shuber@huberry.com'
  s.homepage = 'http://github.com/shuber/abstract_class'

  s.has_rdoc = false
  s.rdoc_options = ['--line-numbers', '--inline-source', '--main', 'README.rdoc']

  s.require_paths = ['lib']

  s.files = %w(
    lib/abstract_class.rb
    lib/abstract_class/test_helper.rb
    lib/abstract_class/version.rb
    MIT-LICENSE
    Rakefile
    README.rdoc
    test/abstract_class_test.rb
    test/test_helper.rb
  )

  s.test_files = %w(
    test/abstract_class_test.rb
    test/test_helper.rb
  )
end