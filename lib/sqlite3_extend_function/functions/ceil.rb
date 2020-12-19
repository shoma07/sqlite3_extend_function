# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Ceil
    module Ceil
      class << self
        # @return [String]
        def name
          'ceil'
        end

        # @return [void]
        def call(func, dp)
          return if dp.nil?

          func.result = Float(dp).ceil.to_i
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
