# frozen_string_literal: true

module SQLite3ExtendFunction
  # SQLite3ExtendFunction::Function
  class Function
    # @param [Class] mod
    # @return [void]
    def initialize(mod)
      @mod = mod
    end

    # @return [String]
    def name
      mod.name.split('::').last
         .gsub(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
         .gsub(/([a-z\d])([A-Z])/, '\1_\2')
         .tr('-', '_').downcase
    end

    # @return [Proc]
    def to_proc
      ->(func, *argv) { func.result = mod.call(*argv) }
    end

    # @return [Integer]
    def arity
      mod.method(:call).parameters.size
    end

    private

    # @!attribute [r] mod
    # @return [Class]
    attr_reader :mod
  end
end
