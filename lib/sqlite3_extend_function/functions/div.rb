# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Div
    module Div
      class << self
        # @return [void]
        def call(func, y, x)
          return if y.nil? || x.nil?

          func.result = Float(y).div(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, 'invalid input syntax for type numeric'
        end
      end
    end
  end
end
