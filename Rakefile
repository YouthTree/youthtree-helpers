require 'rubygems'
require 'rake'

require 'active_support'
require 'active_support/core_ext'
require File.expand_path('lib/youth_tree/helpers', File.dirname(__FILE__))

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name        = "youthtree-helpers"
    gem.summary     = "A exceedingly simple set of helpers used across Youth Tree web applications."
    gem.description = "Helpers to make life easier when coding YT-specific apps. see the code.."
    gem.email       = "sutto@sutto.net"
    gem.homepage    = "http://github.com/YouthTree/youthtree-helpers"
    gem.authors     = ["Darcy Laycock"]
    gem.version     = YouthTree::Helpers::VERSION
    gem.add_dependency "activesupport",      "~> 3.0.0.rc"
    gem.add_dependency "actionpack",         "~> 3.0.0.rc"
    gem.add_dependency "youthtree-js"
    gem.add_dependency "youthtree-settings"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "youthtree-helpers #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
