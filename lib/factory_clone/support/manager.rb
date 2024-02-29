require 'singleton'
require 'factory_clone/schema/structure'
require 'factory_clone/errors/already_defined_factory'

module FactoryClone::Support
  class Manager
    include Singleton

    def register(name, &block)
      name = name.to_sym
      raise_if_registered(name)
      schema[name] = FactoryClone::Schema::Structure.new(name, &block)
    end

    def [](name)
      schema[name.to_sym]
    end

    private

    def raise_if_registered(name)
      return unless self[name]

      raise FactoryClone::Errors::AlreadyDefinedFactory, name.capitalize
    end

    def schema
      @schema ||= {}
    end
  end
end