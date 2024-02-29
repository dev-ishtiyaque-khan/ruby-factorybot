require 'factory_clone/errors/invalid_class'
require 'factory_clone/support/evaluator'
require 'factory_clone/support/generator'

module FactoryClone::Schema
  class Structure
    attr_accessor :name, :block
    attr_writer :attributes

    def initialize(name, &block)
      self.name = name
      self.block = block
    end

    def create(overrides)
      merge_attributes(overrides).instance_eval { generator.call(attributes) }
    end

    def write_attribute(attribute_name, value)
      attributes[attribute_name.to_sym] = value
    end

    private

    def merge_attributes(overrides)
      clone.tap do |structure|
        overrides.each do |name, value|
          structure.write_attribute(name, value)
        end
      end
    end

    def attributes
      load_default_attributes
      @attributes ||= {}
    end

    def load_default_attributes
      return if loaded_default_attributes?
      @loaded_default_attributes = true

      FactoryClone::Support::Evaluator.new.call(self, &block)
    end

    def loaded_default_attributes?
      !!@loaded_default_attributes
    end

    def generator
      @_generator ||= FactoryClone::Support::Generator.new(klass)
    end

    def klass
      @_klass ||= begin
        Object.const_get(name.capitalize)
      rescue
        raise FactoryClone::Errors::InvalidClass, name.capitalize
      end
    end
  end
end