# frozen_string_literal: true

module SQLite3ExtendFunctions
  module Rails
    # SQLite3ExtendFunctions::Rails
    class Railtie < ::Rails::Railtie
      initializer 'sqlite3_functions' do
        ActiveRecord::ConnectionAdapters::AbstractAdapter.set_callback(
          :checkout, :before, -> (conn) {
            return if conn.adapter_name != 'SQLite'

            conn.raw_connection.create_function('ceil', 1) do |func, value|
              func.result = if value.nil?
                              nil
                            elsif value.is_a? Numeric
                              value.ceil
                            else
                              0
                            end
            end
            conn.raw_connection.create_function('floor', 1) do |func, value|
              func.result = if value.nil?
                              nil
                            elsif value.is_a? Numeric
                              value.floor
                            else
                              0
                            end
            end
          }
        )
      end
    end
  end
end
