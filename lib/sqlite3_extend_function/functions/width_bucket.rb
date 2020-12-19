# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::WidthBucket
    module WidthBucket
      class << self
        # @param [Float, Integer] operand
        # @param [Integer, Float] b1
        # @param [Integer, Float] b2
        # @param [Integer] count
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(operand, b1, b2, count)
          raise ArgumentError unless count.positive?

          result = (Float(operand) / ((Float(b2) - Float(b1)) / Float(count))).ceil
          result = count + 1 if result > count
          result = 0 if result.negative?
          result.to_i
        rescue ArgumentError
          raise SQLite3::SQLException, 'ArgumentError'
        end
      end
    end
  end
end
