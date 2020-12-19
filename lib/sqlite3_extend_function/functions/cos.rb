# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Ceil
    module Cos
      class << self
        # @return [String]
        def name
          'cos'
        end

        # @return [void]
        def call(func, x)
          func.result = Math.cos(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
