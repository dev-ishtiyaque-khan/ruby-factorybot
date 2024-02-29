require 'factory_clone/errors/invalid_attribute'

module FactoryClone::Support
  class Generator
    attr_reader :_instance

    def initialize(klass)
      @_instance = klass.new
    end

    def call(attributes = {})
      set_attributes(attributes)
      _instance
    end

    private

    def set_attributes(attributes)
      attributes.each do |key, value|
        begin
          _instance.send("#{key}=", value.to_s)
        rescue
          raise FactoryClone::Errors::InvalidAttribute, key.capitalize
        end
      end        
    end
  end
end