# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Ceil
    module Cot
      class << self
        # @return [String]
        def name
          'cot'
        end

        # @return [void]
        def call(func, x)
          func.result = 1 / Math.tan(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
