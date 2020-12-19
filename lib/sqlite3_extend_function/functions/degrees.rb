# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Degrees
    module Degrees
      class << self
        # @return [String]
        def name
          'degrees'
        end

        # @return [void]
        def call(func, dp)
          return if dp.nil?

          func.result = Float(dp) * 180 / Math::PI
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
