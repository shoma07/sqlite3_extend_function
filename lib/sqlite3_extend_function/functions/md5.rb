# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Md5
    module Md5
      class << self
        # @return [void]
        def call(func, str)
          return if str.nil?

          func.result = Digest::MD5.hexdigest(str)
        rescue StandardError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
