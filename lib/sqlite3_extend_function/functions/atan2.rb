# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Atan2
    module Atan2
      class << self
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
