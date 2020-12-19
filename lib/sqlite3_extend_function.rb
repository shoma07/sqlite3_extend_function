# frozen_string_literal: true

require 'bigdecimal'
require 'base64'
require 'digest/md5'
require 'sqlite3_extend_function/version'
require 'sqlite3_extend_function/function'
require 'sqlite3_extend_function/functions'

# SQLite3ExtendFunction
module SQLite3ExtendFunction
  # @param [Class] base
  # @return [void]
  def self.included(base)
    base.class_eval do
      original_method = instance_method(:initialize)
      define_method(:initialize) do |*args, &block|
        result = original_method.bind(self).call(*args)
        Functions.each { |func| create_function(func.name, func.arity, &func.to_proc) }
        block&.call(self)
        result
      end
    end
  end
end
