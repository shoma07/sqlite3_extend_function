# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Cbrt
    module Cbrt
      class << self
        # @return [String]
        def name
          'cbrt'
        end

        # @return [void]
        def call(func, dp)
          return if dp.nil?

          result = Math.cbrt(Kernel.Float(dp))
          func.result = result.to_i == result ? result.to_i : result
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
