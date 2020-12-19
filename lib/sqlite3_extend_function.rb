# frozen_string_literal: true

require 'bigdecimal'
require 'base64'
require 'digest/md5'
require 'sqlite3_extend_function/version'
require 'sqlite3_extend_function/functions'

# SQLite3ExtendFunction
module SQLite3ExtendFunction
  def self.included(base)
    base.class_eval do
      original_method = instance_method(:initialize)
      define_method(:initialize) do |*args, &block|
        result = original_method.bind(self).call(*args)
        SQLite3ExtendFunction::Functions.constants.each do |const_name|
          const = Object.const_get("SQLite3ExtendFunction::Functions::#{const_name}")
          func = const.method(:call)
          create_function(const.name, (func.parameters.size - 1), &func)
        end
        block&.call(self)
        result
      end
    end
  end
end
