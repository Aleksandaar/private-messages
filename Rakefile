require "bundler/gem_tasks"
require 'rake'
require 'rake/testtask'


desc 'Default: run unit tests.'
task :default => :test

desc 'Test the private_messages gem.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_model.rb'
  t.verbose = true
end


