# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Ceil
    module Ceil
      class << self
        # @param [Integer, Float] dp
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(dp)
          return if dp.nil?

          Float(dp).ceil.to_i
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
