# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Ln
    module Ln
      class << self
        # @param [Integer, Float] dp
        # @return [Integer, Float]
        # @raise [SQLite3::SQLException]
        def call(dp)
          dp&.then { |param| Math.log(Float(param)) }
            &.then { |param| param.to_i == param ? param.to_i : param }
        rescue ArgumentError
          raise SQLite3::SQLException, 'cannot take logarithm of a negative number'
        end
      end
    end
  end
end
