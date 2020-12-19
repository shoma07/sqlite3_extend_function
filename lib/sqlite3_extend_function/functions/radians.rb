# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Radians
    module Radians
      class << self
        # @param [Integer, Float] dp
        # @return [Integer, Float]
        # @raise [SQLite3::SQLException]
        def call(dp)
          return if dp.nil?

          result = Float(dp) * Math::PI / 180
          result.to_i == result ? result.to_i : result
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
