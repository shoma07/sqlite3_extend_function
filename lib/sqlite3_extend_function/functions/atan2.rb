# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Cbrt
    module Atan2
      class << self
        # @return [String]
        def name
          'atan2'
        end

        # @return [void]
        def call(func, y, x)
          func.result = Math.atan2(Float(y), Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, 'invalid input syntax for type double precision'
        end
      end
    end
  end
end
