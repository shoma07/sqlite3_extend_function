# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Degrees
    module Degrees
      class << self
        # @param [Integer, Float] dp
        # @return [Float]
        # @raise [SQLite3::SQLException]
        def call(dp)
          Float(dp) * 180 / Math::PI unless dp.nil?
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
