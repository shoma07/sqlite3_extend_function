# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Atan2
    module Atan2
      class << self
        # @param [Integer, Float] y
        # @param [Integer, Float] x
        # @return [Float]
        # @raise [SQLite3::SQLException]
        def call(y, x)
          Math.atan2(Float(y), Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, 'invalid input syntax for type double precision'
        end
      end
    end
  end
end
