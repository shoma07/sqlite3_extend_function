# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Div
    module Div
      class << self
        # @param [Integer, Float] y
        # @param [Integer, Float] x
        # @return [Integer, Float]
        # @raise [SQLite3::SQLException]
        def call(y, x)
          Float(y).div(Float(x)) unless y.nil? || x.nil?
        rescue ArgumentError
          raise SQLite3::SQLException, 'invalid input syntax for type numeric'
        end
      end
    end
  end
end
