# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Pi
    module Pi
      class << self
        # @return [String]
        def name
          'pi'
        end

        # @return [void]
        def call(func)
          func.result = Math::PI
        end
      end
    end
  end
end
