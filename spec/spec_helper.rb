ENV['ENV'] ||= 'test'

require 'bundler/setup'
Bundler.setup

require 'coveralls'

if Coveralls.should_run?
  Coveralls.wear!
else
  require 'simplecov'
  SimpleCov.start
end

require '../loader'
require 'support/helper'
require 'support/factory_bot'

RSpec.configure do |config|
  config.order = 'random'
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
