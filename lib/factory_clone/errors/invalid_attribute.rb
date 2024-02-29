module FactoryClone::Errors
  class InvalidAttribute < StandardError
    def initialize(string)
      super("Attribute #{string} is not defined")
    end
  end
end