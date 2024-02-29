module FactoryClone::Errors
  class AlreadyDefinedFactory < StandardError
    def initialize(string)
      super("Factory #{string} already defined")
    end
  end
end