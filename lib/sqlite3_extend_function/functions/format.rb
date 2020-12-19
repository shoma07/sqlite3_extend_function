# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Format
    module Format
      class << self
        # @param [String] formartstr
        # @param [Array<Object>] args
        # @return [String]
        def call(formartstr, *args)
          formartstr % args
        end
      end
    end
  end
end
