# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Log
    module Log
      class << self
        # @return [void]
        def call(func, y, x = nil)
          return if y.nil?
          return func.result = Math.log(x, y) unless x.nil?

          result = Math.log10(Float(y))
          func.result = result.to_i == result ? result.to_i : result
        rescue ArgumentError
          raise SQLite3::SQLException, 'invalid input syntax for type numeric'
        end
      end
    end
  end
end
