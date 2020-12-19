# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Radians
    module Tan
      class << self
        # @return [String]
        def name
          'tan'
        end

        # @return [void]
        def call(func, x)
          func.result = Math.tan(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
