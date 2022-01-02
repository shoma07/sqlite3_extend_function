# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::ConcatWs
    module ConcatWs
      class << self
        # @param [String] sep
        # @param [Array<String>] args
        # @return [String]
        # @raise [SQLite3::SQLException]
        def call(sep, *args)
          args.compact.join(sep)
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
                                       'You might need to add explicit type casts.'
        end
      end
    end
  end
end
