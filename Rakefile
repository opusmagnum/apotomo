require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.test_files = FileList['test/unit/*_test.rb', 'test/rails/*_test.rb']# - ['test/rails/capture_test.rb']
  test.verbose = true
end
