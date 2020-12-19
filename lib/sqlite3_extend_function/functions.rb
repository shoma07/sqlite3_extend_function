# frozen_string_literal: true

Dir["#{__dir__}/functions/**/*.rb"].sort.each { |f| require f }

module SQLite3ExtendFunction
  # SQLite3ExtendFunction::Functions
  module Functions
    class << self
      # @return [void]
      def each
        constants.each do |const|
          yield SQLite3ExtendFunction::Function.new(const_get(const))
        end
      end
    end
  end
end
