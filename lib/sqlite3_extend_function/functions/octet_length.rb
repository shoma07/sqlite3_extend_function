# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::OctetLength
    module OctetLength
      class << self
        # @param [String] str
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(str)
          str.bytesize
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
                                       'You might need to add explicit type casts.'
        end
      end
    end
  end
end
