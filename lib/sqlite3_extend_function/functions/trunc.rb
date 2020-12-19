# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Trunc
    module Trunc
      class << self
        # @param [Integer, Float] v
        # @param [Integer] s
        # @return [Integer, Float]
        # @raise [SQLite3::SQLException]
        def call(v, s = 0)
          return if v.nil?
          raise ArgumentError if s.is_a?(Integer)

          dec = BigDecimal(s.zero? ? '1.0' : (1.0 / (10**s)).to_s)
          result = (v / dec).to_i * dec
          result.to_i == result ? result.to_i : result.to_f
        rescue ArgumentError
          raise SQLite3::SQLException, 'invalid input syntax for type double precision'
        end
      end
    end
  end
end
