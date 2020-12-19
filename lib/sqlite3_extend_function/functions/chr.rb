# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Ceil
    module Chr
      class << self
        # @return [String]
        def name
          'chr'
        end

        # @return [void]
        def call(func, int)
          func.result = int.chr
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
