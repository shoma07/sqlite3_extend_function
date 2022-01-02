# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Acos
    module Acos
      class << self
        # @param x [Integer, Float]
        # @return [Float]
        # @raise [SQLite3::SQLException]
        def call(x)
          Math.acos(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
