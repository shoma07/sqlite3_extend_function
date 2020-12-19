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
          return if dp.nil?

          result = Math.exp(Float(dp))
          result.to_i == result ? result.to_i : result
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
