# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Cbrt
    module Atan
      class << self
        # @return [String]
        def name
          'atan'
        end

        # @return [void]
        def call(func, x)
          func.result = Math.atan(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
