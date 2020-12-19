# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Power
    module Power
      class << self
        # @param [Integer, Float] a
        # @param [Integer, Float] b
        # @return [Integer, Float]
        # @raise [SQLite3::SQLException]
        def call(a, b)
          return if a.nil? || b.nil?

          result = Float(a)**Float(b)
          result.to_i == result ? result.to_i : result
        rescue ArgumentError
          raise SQLite3::SQLException, 'invalid input syntax for type double precision'
        end
      end
    end
  end
end
