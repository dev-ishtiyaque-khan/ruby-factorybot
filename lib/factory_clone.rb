# frozen_string_literal: true

require_relative 'factory_clone/version'
require_relative 'factory_clone/support/manager'
require_relative 'factory_clone/errors/undefined_factory'

module FactoryClone
  class Error < StandardError; end

  def factory(name, &block)
    FactoryClone.manager.register(name, &block)
  end
  module_function :factory

  def create(name, overrides = {})
    FactoryClone.schema(name.to_sym).create(overrides)
  end
  module_function :create

  def self.schema(name)
    FactoryClone.manager[name] || raise(FactoryClone::Errors::UndefinedFactory, name)
  end

  def self.manager
    @manager ||= FactoryClone::Support::Manager.instance
  end
end
