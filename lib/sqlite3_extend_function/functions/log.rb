# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Log
    module Log
      class << self
        # @param [Integer, Float] y
        # @param [Integer, Float, NilClass] x
        # @return [Integer, Float]
        # @raise [SQLite3::SQLException]
        def call(y, x = nil)
          return if y.nil?
          return Math.log(x, y) unless x.nil?

          result = Math.log10(Float(y))
          result.to_i == result ? result.to_i : result
        rescue ArgumentError
          raise SQLite3::SQLException, 'invalid input syntax for type numeric'
        end
      end
    end
  end
end
