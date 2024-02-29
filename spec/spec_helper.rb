require 'bundler/setup'
require './lib/factory_clone.rb'

Bundler.setup

RSpec.configuration do |config|
  config.extend FactoryClone
end