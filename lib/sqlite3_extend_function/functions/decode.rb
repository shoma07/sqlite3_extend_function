# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Decode
    module Decode
      class << self
        # @todo implement escape
        #
        # @param [String] str
        # @param [String] format
        # @return [String]
        # @raise [SQLite3::SQLException]
        def call(str, format)
          return if str.nil?
          raise ArgumentError unless str.is_a?(String)

          return Base64.decode64(str) if format == 'base64'
          return str.scan(/.{2}/).map { |s| s.hex.chr }.join if format == 'hex'

          raise  ArgumentError
        rescue ArgumentError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
                                       'You might need to add explicit type casts.'
        end
      end
    end
  end
end
