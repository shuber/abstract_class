require 'rake'
require 'rake/testtask'
require 'rake/task'
require 'rdoc'

desc 'Default: run unit tests'
task :default => :test

desc 'Test the abstract_class gem'
Rake::TestTask.new(:test) do |t|
  t.libs += ['lib', 'test']
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the abstract_class gem'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'abstract_class'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
