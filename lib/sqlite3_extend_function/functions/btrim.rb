# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Cbrt
    module Btrim
      class << self
        # @return [String]
        def name
          'btrim'
        end

        # @return [void]
        def call(func, text, chrs = '')
          func.result = text.sub(/\A[#{chrs}]*/, '').sub(/[#{chrs}]*\z/, '')
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
