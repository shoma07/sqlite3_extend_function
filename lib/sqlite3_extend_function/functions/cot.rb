# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Cot
    module Cot
      class << self
        # @param [Integer, Float] x
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(x)
          1 / Math.tan(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
