# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Concat
    module Concat
      class << self
        # @return [String]
        def name
          'concat'
        end

        # @return [void]
        def call(func, *args)
          func.result = args.compact.join
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
