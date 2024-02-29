module FactoryClone::Errors
  class InvalidClass < StandardError
    def initialize(string)
      super("No class found for #{string}")
    end
  end
end