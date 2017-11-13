require 'bundler/setup'

desc 'Default: run specs.'
task :default do
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |config|
    config.verbose = false
  end

  Rake::Task['spec'].invoke
end


