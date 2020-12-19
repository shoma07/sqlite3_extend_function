# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Cbrt
    module Acos
      class << self
        # @return [String]
        def name
          'acos'
        end

        # @return [void]
        def call(func, x)
          func.result = Math.acos(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
