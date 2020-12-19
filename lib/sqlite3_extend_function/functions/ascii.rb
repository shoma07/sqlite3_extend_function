# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Ascii
    module Ascii
      class << self
        # @param [String] str
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(str)
          str.is_a?(String) ? str.ord : (raise ArgumentError)
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
