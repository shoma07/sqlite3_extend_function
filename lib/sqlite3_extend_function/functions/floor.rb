# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Floor
    module Floor
      class << self
        # @return [String]
        def name
          'floor'
        end

        # @return [void]
        def call(func, dp)
          return if dp.nil?

          func.result = Float(dp).floor.to_i
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
