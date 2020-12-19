# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Encode
    module Encode
      class << self
        # @return [void]
        def call(func, data, format)
          return if data.nil?

          func.result = (data.is_a?(String) && (raise ArgumentError)) ||
                        (format == 'base64' && Base64.encode64(data)) ||
                        (format == 'hex' && data.unpack('C*').map { |c| c.to_s(16) }.join) ||
                        (raise ArgumentError)
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
