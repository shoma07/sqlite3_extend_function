# frozen_string_literal: true

require 'active_record'
require 'sqlite3_extend_function/version'
require 'sqlite3_extend_function/function'
require 'sqlite3_extend_function/configuration'

# SQLite3ExtendFunction
module SQLite3ExtendFunction
  extend Configuration

  def self.included(klass)
    klass.set_callback(:checkout, :before, lambda { |conn|
      return if conn.adapter_name != 'SQLite'

      SQLite3ExtendFunction.options[:functions].each do |func|
        lmd = Function.send(func)
        args = lmd.parameters.size - 1
        conn.raw_connection.create_function(func.to_s, args, &lmd)
      end
    })
  end
end

ActiveRecord::ConnectionAdapters::AbstractAdapter.include(SQLite3ExtendFunction)
