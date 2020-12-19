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
          return if dp.nil?

          result = Math.log(Float(dp))
          result.to_i == result ? result.to_i : result
        rescue ArgumentError
          raise SQLite3::SQLException, 'cannot take logarithm of a negative number'
        end
      end
    end
  end
end
