# frozen_string_literal: true

require 'bigdecimal'
require 'base64'
require 'digest/md5'
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

      # return the bucket number to which operand would be assigned input
      # a histogram having count equal-width buckets spanning the range b1 to b2;
      # returns 0 or count+1 for an input outside the range
      # @return [Proc]
      def width_bucket
        lambda do |func, operand, b1, b2, count|
          begin
            operand = Kernel.Float(operand)
            b1 = Kernel.Float(b1)
            b2 = Kernel.Float(b2)
            count = Kernel.Float(count)

            raise ArgumentError unless count.positive?
            result = (operand / ((b2 - b1) / count)).ceil
            result = count + 1 if result > count
            result = 0 if result.negative?
            func.result = result.to_i
          rescue ArgumentError
            raise SQLite3::SQLException,
                  'ArgumentError'
          end
        end
      end

      # @return [Proc]
      def acos
        lambda do |func, x|
          begin
            func.result = Math.acos(Kernel.Float(x))
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: #{x}"
          end
        end
      end

      # @return [Proc]
      def asin
        lambda do |func, x|
          begin
            func.result = Math.asin(Kernel.Float(x))
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: #{x}"
          end
        end
      end

      # @return [Proc]
      def atan
        lambda do |func, x|
          begin
            func.result = Math.atan(Kernel.Float(x))
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: #{x}"
          end
        end
      end

      # @return [Proc]
      def atan2
        lambda do |func, y, x|
          begin
            func.result = Math.atan2(Kernel.Float(y), Kernel.Float(x))
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision"
          end
        end
      end

      # @return [Proc]
      def cos
        lambda do |func, x|
          begin
            func.result = Math.cos(Kernel.Float(x))
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: #{x}"
          end
        end
      end

      # @return [Proc]
      def cot
        lambda do |func, x|
          begin
            func.result = 1 / Math.tan(Kernel.Float(x))
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: #{x}"
          end
        end
      end

      # @return [Proc]
      def sin
        lambda do |func, x|
          begin
            func.result = Math.sin(Kernel.Float(x))
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: #{x}"
          end
        end
      end

      # @return [Proc]
      def tan
        lambda do |func, x|
          begin
            func.result = Math.tan(Kernel.Float(x))
          rescue ArgumentError
            raise SQLite3::SQLException,
                  "invalid input syntax for type double precision: #{x}"
          end
        end
      end

      # Number of bits in string
      # @return [Proc]
      def bit_length
        lambda do |func, str|
          begin
            func.result = str.bytesize * 8
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # Number of characters in string
      # @return [Proc]
      def char_length
        lambda do |func, str|
          begin
            func.result = str.length
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # octet_length
      # @return [Proc]
      def octet_length
        lambda do |func, str|
          begin
            func.result = str.bytesize
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # @return [Proc]
      def ascii
        lambda do |func, str|
          begin
            raise ArgumentError if str.is_a? String

            func.result = str.ord
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # @return [Proc]
      def btrim
        lambda do |func, text, chrs = ''|
          begin
            func.result = text.sub(/\A[#{chrs}]*/, '').sub(/[#{chrs}]*\z/, '')
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # @return [Proc]
      def chr
        lambda do |func, int|
          begin
            func.result = int.chr
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # @return [Proc]
      def concat
        lambda do |func, *args|
          begin
            func.result = args.compact.join
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # @return [Proc]
      def concat_ws
        lambda do |func, sep, *args|
          begin
            func.result = args.compact.join(sep)
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # @return [Proc]
      def decode
        lambda do |func, str, format|
          return if data.nil?

          begin
            raise ArgumentError if data.is_a? String

            func.result = case format
                          when 'base64'
                            Base64.decode64(str)
                          when 'hex'
                            str.scan(/.{2}/).map(&:hex).map(&:chr).join
                          when 'escape'
                            raise ArgumentError
                          else
                            raise ArgumentError
                          end
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # @return [Proc]
      def encode
        lambda do |func, data, format|
          return if data.nil?

          begin
            raise ArgumentError if data.is_a? String

            func.result = case format
                          when 'base64'
                            Base64.encode64(data)
                          when 'hex'
                            data.unpack("C*").map { |c| c.to_s(16) }.join
                          when 'escape'
                            raise ArgumentError
                          else
                            raise ArgumentError
                          end
          rescue ArgumentError
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # @return [Proc]
      def format
        lambda do |func, formartstr, *args|
          func.result = formartstr % args
        end
      end

      # @return [Proc]
      def initcap
        lambda do |func, str|
          return if str.nil?

          begin
            regexp = /([a-zA-Z0-9]*|[^a-zA-Z0-9]*)/
            func.result = str.split(regexp).map.with_index { |s, i|
              i.odd? ? s.downcase.capitalize : s
            }.join
          rescue
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # @return [Proc]
      def md5
        lambda do |func, str|
          return if str.nil?

          begin
            func.result = Digest::MD5.hexdigest(str)
          rescue
            raise SQLite3::SQLException,
                 "No function matches the given name and argument types. You might need to add explicit type casts."
          end
        end
      end

      # Current date and time (start of current transaction)
      # @return [Proc]
      def now
        lambda do |func|
          func.result = Time.now.strftime('%Y-%m-%d %H:%M:%S.%6N%:z')
        end
      end
    end
  end
end
