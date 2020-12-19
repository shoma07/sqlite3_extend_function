# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Decode
    module Decode
      class << self
        # @return [String]
        def name
          'decode'
        end

        # @return [void]
        def call(func, data, format)
          return if data.nil?

          func.result = (data.is_a?(String) && (raise ArgumentError)) ||
                        (format == 'base64' && Base64.decode64(data)) ||
                        (format == 'hex' && data.scan(/.{2}/).map(&:hex).map(&:chr).join) ||
                        (raise  ArgumentError)
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
