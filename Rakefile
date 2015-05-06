require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

require 'inch/rake'
Inch::Rake::Suggest.new('doc:suggest')

task default: [:rubocop, 'doc:suggest', :spec]
