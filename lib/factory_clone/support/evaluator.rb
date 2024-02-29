module FactoryClone::Support
  class Evaluator
    attr_reader :structure

    def call(structure, &block)
      @structure = structure
      instance_eval(&block)
    end

    def method_missing(method_name, &block)
      structure.write_attribute(method_name, block.call)
    end
  end
end