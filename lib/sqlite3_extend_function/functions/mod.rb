# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Mod
    module Mod
      class << self
        # @param [Integer, Float] y
        # @param [Integer, Float] x
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(y, x = nil)
          Float(y).modulo(Float(x)).to_i
        rescue ArgumentError
          raise SQLite3::SQLException,
                'Could not choose a best candidate function. You might need to add explicit type casts.'
        end
      end
    end
  end
end
