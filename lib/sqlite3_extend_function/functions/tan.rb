# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Tan
    module Tan
      class << self
        # @param [Float, Integer] x
        # @return [Float]
        # @raise [SQLite3::SQLException]
        def call(x)
          Math.tan(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
