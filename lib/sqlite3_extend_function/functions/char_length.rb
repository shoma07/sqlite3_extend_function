# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::CharLength
    module CharLength
      class << self
        # @param str [String]
        # @return [Integer]
        # @raise [SQLite3::SQLException]
        def call(str)
          str.length
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
                                       'You might need to add explicit type casts.'
        end
      end
    end
  end
end
