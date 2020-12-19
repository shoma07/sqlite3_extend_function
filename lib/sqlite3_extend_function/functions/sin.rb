# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Radians
    module Sin
      class << self
        # @return [String]
        def name
          'sin'
        end

        # @return [void]
        def call(func, x)
          func.result = Math.sin(Float(x))
        rescue ArgumentError
          raise SQLite3::SQLException, "invalid input syntax for type double precision: #{x}"
        end
      end
    end
  end
end
