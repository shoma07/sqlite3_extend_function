# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Radians
    module WidthBucket
      class << self
        # @return [String]
        def name
          'width_bucket'
        end

        # @return [void]
        def call(func, operand, b1, b2, count)
          count = Float(count)
          raise ArgumentError unless count.positive?

          result = (Float(operand) / ((Float(b2) - Float(b1)) / count)).ceil
          result = count + 1 if result > count
          result = 0 if result.negative?
          func.result = result.to_i
        rescue ArgumentError
          raise SQLite3::SQLException, 'ArgumentError'
        end
      end
    end
  end
end
