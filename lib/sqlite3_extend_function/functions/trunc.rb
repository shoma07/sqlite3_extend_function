# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Trunc
    module Trunc
      class << self
        # @return [void]
        def call(func, dp, s = 0)
          return if dp.nil?

          ss = BigDecimal(Float(s).to_s)
          dec = ss.zero? ? BigDecimal('1.0') : BigDecimal((1.0 / (10**ss).to_f).to_s)
          result = (BigDecimal(Float(dp).to_s) / dec).to_i * dec
          func.result = result.to_i == result ? result.to_i : result.to_f
        rescue ArgumentError
          raise SQLite3::SQLException, 'invalid input syntax for type double precision'
        end
      end
    end
  end
end
