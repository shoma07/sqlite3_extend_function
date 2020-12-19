# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Ln
    module Ln
      class << self
        # @return [void]
        def call(func, dp)
          return if dp.nil?

          result = Math.log(Float(dp))
          func.result = result.to_i == result ? result.to_i : result
        rescue ArgumentError
          raise SQLite3::SQLException, 'cannot take logarithm of a negative number'
        end
      end
    end
  end
end
