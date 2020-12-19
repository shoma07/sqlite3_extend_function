# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Md5
    module Md5
      class << self
        # @param [String] str
        # @return [String]
        # @raise [SQLite3::SQLException]
        def call(str)
          Digest::MD5.hexdigest(str) unless str.nil?
        rescue StandardError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
