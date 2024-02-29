module FactoryClone::Errors
  class UndefinedFactory < StandardError
    def initialize(string)
      super("No Factory defined for #{string}")
    end
  end
end