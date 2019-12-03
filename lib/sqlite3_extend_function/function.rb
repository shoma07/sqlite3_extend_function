# frozen_string_literal: true

require 'bigdecimal'
module SQLite3ExtendFunction
  # SQLite3ExtendFunction::Function
  module Function
    class << self
      # @return [Proc]
      def ceil
        lambda do |func, dp|
          return if dp.nil?

          begin
            func.result = Kernel.Float(dp).ceil.to_i
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: \"#{dp}\""
          end
        end
      end

      # @return [Proc]
      def floor
        lambda do |func, dp|
          return if dp.nil?

          begin
            func.result = Kernel.Float(dp).floor.to_i
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: \"#{dp}\""
          end
        end
      end

      # cube root
      # @return [Proc]
      def cbrt
        lambda do |func, dp|
          return if dp.nil?

          begin
            result = Math.cbrt(Kernel.Float(dp))
            func.result = result.to_i == result ? result.to_i : result
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: \"#{dp}\""
          end
        end
      end

      # radians to degrees
      # @return [Proc]
      def degrees
        lambda do |func, dp|
          return if dp.nil?

          begin
            func.result = Kernel.Float(dp) * 180 / Math::PI
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: \"#{dp}\""
          end
        end
      end

      # integer quotient of y/x
      # @return [Proc]
      def div
        lambda do |func, y, x|
          return if y.nil? || x.nil?

          begin
            func.result = Kernel.Float(y).div(Kernel.Float(x))
          rescue ArgumentError
            raise SQLite3::SQLException,
                  'invalid input syntax for type numeric'
          end
        end
      end

      # exponential
      # @return [Proc]
      def exp
        lambda do |func, dp|
          return if dp.nil?

          begin
            result = Math.exp(Kernel.Float(dp))
            func.result = result.to_i == result ? result.to_i : result
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: \"#{dp}\""
          end
        end
      end

      # natural logarithm
      # @return [Proc]
      def ln
        lambda do |func, dp|
          return if dp.nil?

          begin
            result = Math.log(Kernel.Float(dp))
            func.result = result.to_i == result ? result.to_i : result
          rescue ArgumentError
            raise SQLite3::SQLException,
                  'cannot take logarithm of a negative number'
          end
        end
      end

      # base 10 logarithm
      # @return [Proc]
      def log
        lambda do |func, y, x = nil|
          if x.nil?
            return if y.nil?

            result = Math.log10(Kernel.Float(y))
            func.result = result.to_i == result ? result.to_i : result
          else
            return if y.nil? || x.nil?

            func.result = Math.log(x, y)
          end
        rescue ArgumentError
          raise SQLite3::SQLException,
                'invalid input syntax for type numeric'
        end
      end

      # remainder of y/x
      # @return [Proc]
      def mod
        lambda do |func, y, x|
          func.result = Kernel.Float(y).modulo(Kernel.Float(x)).to_i
        rescue ArgumentError
          raise SQLite3::SQLException,
                'Could not choose a best candidate function. You might need to add explicit type casts.'
        end
      end

      # "π" constant
      # @return [Proc]
      def pi
        lambda do |func|
          func.result = Math::PI
        end
      end

      # a raised to the power of b
      # @return [Proc]
      def power
        lambda do |func, a, b|
          return if a.nil? || b.nil?

          begin
            result = Kernel.Float(a)**Kernel.Float(b)
            func.result = result.to_i == result ? result.to_i : result
          rescue ArgumentError
            raise SQLite3::SQLException,
                  'invalid input syntax for type double precision'
          end
        end
      end

      # degrees to radians
      # @return [Proc]
      def radians
        lambda do |func, dp|
          return if dp.nil?

          begin
            result = Kernel.Float(dp) * Math::PI / 180
            func.result = result.to_i == result ? result.to_i : result
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: \"#{dp}\""
          end
        end
      end

      # sign of the argument (-1, 0, +1)
      # @return [Proc]
      def sign
        lambda do |func, dp|
          return if dp.nil?

          begin
            value = Kernel.Float(dp)
            func.result = if value.zero?
                            0
                          elsif value.positive?
                            1
                          else
                            -1
                          end
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: \"#{dp}\""
          end
        end
      end

      # square root
      # @return [Proc]
      def sqrt
        lambda do |func, dp|
          return if dp.nil?

          begin
            result = Math.sqrt(Kernel.Float(dp))
            func.result = result.to_i == result ? result.to_i : result
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: \"#{dp}\""
          end
        end
      end

      # truncate toward zero
      # @return [Proc]
      def trunc
        lambda do |func, dp, s = 0|
          return if dp.nil?

          begin
            ss = BigDecimal(Kernel.Float(s).to_s)
            dec = if ss.zero?
                    BigDecimal('1.0')
                  else
                    BigDecimal((1.0 / (10**ss).to_f).to_s)
                  end
            result = (BigDecimal(Kernel.Float(dp).to_s) / dec).to_i * dec
            func.result = result.to_i == result ? result.to_i : result.to_f
          rescue ArgumentError
            raise SQLite3::SQLException,
                  'invalid input syntax for type double precision'
          end
        end
      end
    end
  end
end
