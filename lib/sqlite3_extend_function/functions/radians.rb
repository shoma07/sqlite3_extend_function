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
          dp&.then { |param| Float(param) * Math::PI / 180 }
            &.then { |param| param.to_i == param ? param.to_i : param }
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
