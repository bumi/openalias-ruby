require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'thermite/tasks'

Thermite::Tasks.new

RSpec::Core::RakeTask.new(:spec)

task :default => ['thermite:build', 'thermite:test', 'spec']
