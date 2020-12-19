# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Floor
    module Floor
      class << self
        # @param [Integer, Float] dp
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(dp)
          Float(dp).floor.to_i unless dp.nil?
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: \"#{dp}\""
        end
      end
    end
  end
end
