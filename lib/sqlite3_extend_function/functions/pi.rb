# frozen_string_literal: true

module SQLite3ExtendFunction
  module Functions
    # SQLite3ExtendFunction::Functions::Pi
    module Pi
      class << self
        # @return [Float]
        def call
          Math::PI
        end
      end
    end
  end
end
