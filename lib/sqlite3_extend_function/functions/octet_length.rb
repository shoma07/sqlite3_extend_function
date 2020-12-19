# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Mod
    module OctetLength
      class << self
        # @return [String]
        def name
          'octet_length'
        end

        # @return [void]
        def call(func, str)
          func.result = str.bytesize
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
