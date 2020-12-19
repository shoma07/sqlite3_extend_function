# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Radians
    module Radians
      class << self
        # @return [void]
        def call(func, dp)
          return if dp.nil?

          result = Float(dp) * Math::PI / 180
          func.result = result.to_i == result ? result.to_i : result
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
