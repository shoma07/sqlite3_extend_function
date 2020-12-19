# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Initcap
    module Initcap
      class << self
        # @return [void]
        def call(func, str)
          return if str.nil?

          regexp = /([a-zA-Z0-9]*|[^a-zA-Z0-9]*)/
          func.result = str.split(regexp).map.with_index do |s, i|
            i.odd? ? s.downcase.capitalize : s
          end.join
        rescue StandardError
          raise SQLite3::SQLException, 'No function matches the given name and argument types. ' \
            'You might need to add explicit type casts.'
        end
      end
    end
  end
end
