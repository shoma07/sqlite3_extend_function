# frozen_string_literal: true

module SQLite3ExtendFunction
  # SQLite3ExtendFunction::Configuration
  module Configuration
    mattr_accessor :options

    self.options = {
      functions: Function.singleton_methods
    }

    def configure
      yield self
    end

    # @param [Array] functions
    def functions=(functions)
      options[:functions] = Function.singleton_methods & functions
    end
  end
end
