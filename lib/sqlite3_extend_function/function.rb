# frozen_string_literal: true

module SQLite3ExtendFunction
  # SQLite3ExtendFunction::Function
  module Function
    class << self
      # @return [Proc]
      def ceil
        lambda do |func, value|
          func.result = if value.nil?
                          nil
                        elsif value.is_a? Numeric
                          value.ceil
                        else
                          0
                        end
        end
      end

      # @return [Proc]
      def floor
        lambda do |func, value|
          func.result = if value.nil?
                          nil
                        elsif value.is_a? Numeric
                          value.floor
                        else
                          0
                        end
        end
      end
    end
  end
end
