# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Sign
    module Sign
      class << self
        # @param [Integer, Float] dp
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(dp)
          return if dp.nil?

          value = Float(dp)
          (value.zero? && 0) || (value.positive? && 1) || -1
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
