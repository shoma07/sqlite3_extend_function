# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Exp
    module Exp
      class << self
        # @param [Integer, Float] dp
        # @return [Integer, Float]
        # @raise [SQLite3::SQLException]
        def call(dp)
          db&.then { |param| Math.exp(Float(param)) }
            &.then { |param| param.to_i == param ? param.to_i : param }
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
