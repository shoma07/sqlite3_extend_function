# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Now
    module Now
      class << self
        # @return [String]
        def call
          Time.now.strftime('%Y-%m-%d %H:%M:%S.%6N%:z')
        end
      end
    end
  end
end
