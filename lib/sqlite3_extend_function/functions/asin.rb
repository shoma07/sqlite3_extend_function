# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Asin
    module Asin
      class << self
        # @param [Integer, Float] x
        # @return [Float]
        # @raise [SQLite3::SQLException]
        def call(x)
          Math.asin(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
