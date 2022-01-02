# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Sign
    module Sign
      class << self
        # @param [Integer, Float] dp
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(dp) # rubocop:todo Metrics/CyclomaticComplexity
          dp&.then { |param| Float(param) }
            &.then { |param| (param.zero? && 0) || (param.positive? && 1) || -1 }
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
