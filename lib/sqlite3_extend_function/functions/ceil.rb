# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Ceil
    module Ceil
      class << self
        # @param dp [Integer, Float, nil]
        # @return [Integer, nil]
        # @raise [SQLite3::SQLException]
        def call(dp)
          dp&.then { |param| Integer(Float(param).ceil) }
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
