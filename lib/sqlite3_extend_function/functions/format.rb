# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Format
    module Format
      class << self
        # @return [String]
        def name
          'format'
        end

        # @return [void]
        def call(func, formartstr, *args)
          func.result = formartstr % args
        end
      end
    end
  end
end
