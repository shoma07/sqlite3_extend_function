# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::ConcatWs
    module ConcatWs
      class << self
        # @return [void]
        def call(func, sep, *args)
          func.result = args.compact.join(sep)
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
