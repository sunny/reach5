# Bundler
require "bundler/gem_tasks"

# Rspec
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

# Rubocop
require "rubocop/rake_task"
RuboCop::RakeTask.new(:rubocop)

task default: %i[spec rubocop]
