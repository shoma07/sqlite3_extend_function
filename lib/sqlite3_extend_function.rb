# frozen_string_literal: true

require 'sqlite3'
require 'sqlite3_extend_function/version'
require 'sqlite3_extend_function/function'

# SQLite3ExtendFunction
module SQLite3ExtendFunction
  def self.included(base)
    base.class_eval do
      original_method = instance_method(:initialize)
      define_method(:initialize) do |*args, &block|
        result = original_method.bind(self).call(*args)
        SQLite3ExtendFunction::Function.singleton_methods.each do |func|
          lmd = Function.send(func)
          create_function(func.to_s, (lmd.parameters.size - 1), &lmd)
        end
        # frozen_string_literal: true
        # SQLite3ExtendFunction
        block&.call(self)
        result
      end
    end
  end
end

SQLite3::Database.include(SQLite3ExtendFunction)
