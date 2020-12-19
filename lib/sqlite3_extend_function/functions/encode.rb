# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Encode
    module Encode
      class << self
        # @todo implement escape
        #
        # @param [String] data
        # @param [String] format
        # @return [String, NilClass]
        # @raise [SQLite3::SQLException]
        def call(data, format)
          return if data.nil?
          raise ArgumentError unless data.is_a?(String)

          return Base64.encode64(data) if format == 'base64'
          return data.unpack('C*').map { |c| c.to_s(16) }.join if format == 'hex'

          raise ArgumentError
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
