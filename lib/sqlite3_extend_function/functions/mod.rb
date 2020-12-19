# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Mod
    module Mod
      class << self
        # @return [void]
        def call(func, y, x = nil)
          func.result = Float(y).modulo(Float(x)).to_i
        rescue ArgumentError
          raise SQLite3::SQLException,
                'Could not choose a best candidate function. You might need to add explicit type casts.'
        end
      end
    end
  end
end
