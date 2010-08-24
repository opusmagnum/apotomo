require "rubygems"
require "bundler"

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the Apotomo plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

namespace 'rdoc' do
	desc 'Generate documentation for Apotomo.'
	Rake::RDocTask.new(:build) do |rdoc|
		rdoc.rdoc_dir = 'rdoc'
		rdoc.title    = 'Apotomo API'
		rdoc.options << '--line-numbers' << '--inline-source' << '-m README'
		
		rdoc.rdoc_files.include('lib/**/*.rb')
		rdoc.rdoc_files.include('app/**/*.rb')
		rdoc.rdoc_files.include('test/*.rb')
		rdoc.rdoc_files.include('README')
	end
	
	desc 'Upload the rdocs to apotomo.rubyforge.org.'
	task :upload do
		sh %{ scp -r rdoc nix@rubyforge.org:/var/www/gforge-projects/apotomo/ }
	end
end

# Gem managment tasks.
#
# == Bump gem version (any):
#
#   rake version:bump:major
#   rake version:bump:minor
#   rake version:bump:patch
#
# == Generate gemspec, build & install locally:
#
#   rake gemspec
#   rake build
#   sudo rake install
#
# == Git tag & push to origin/master
#
#   rake release
#
# == Release to Gemcutter.org:
#
#   rake gemcutter:release
#
require 'jeweler'
require 'lib/apotomo/version'

Jeweler::Tasks.new do |spec|
  spec.name         = "apotomo"
  spec.version      = ::Apotomo::VERSION
  spec.summary      = %{Event-driven Widgets for Rails with optional Statefulness.}
  spec.description  = "A generic widget framework for Rails. Event-driven. Clean. Fast. Free optional statefulness included."
  spec.homepage     = "http://apotomo.de"
  spec.authors      = ["Nick Sutterer"]
  spec.email        = "apotonick@gmail.com"

  spec.files = FileList["[A-Z]*", File.join(*%w[{generators,lib,rails,app,config} ** *]).to_s]
  
  spec.add_dependency 'cells', '~> 3.3'
  spec.add_dependency 'activesupport', '>= 2.3.0'
  spec.add_dependency 'onfire', '>= 0.1.0'
end

Jeweler::GemcutterTasks.new