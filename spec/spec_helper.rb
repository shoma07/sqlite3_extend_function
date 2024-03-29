# frozen_string_literal: true

require 'bundler/setup'
require 'sqlite3'
require 'sqlite3_extend_function'

# Dir[File.expand_path('support/*.rb', __dir__)].each { |f| require f }

SQLite3::Database.include(SQLite3ExtendFunction)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
