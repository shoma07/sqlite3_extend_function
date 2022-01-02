# frozen_string_literal: true

require_relative 'lib/sqlite3_extend_function/version'

Gem::Specification.new do |spec|
  spec.name        = 'sqlite3_extend_function'
  spec.version     = SQLite3ExtendFunction::VERSION
  spec.authors     = %w[shoma07]
  spec.email       = %w[23730734+shoma07@users.noreply.github.com]
  spec.homepage    = 'https://github.com/shoma07/sqlite3_extend_function'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')
  spec.summary     = 'Add some user-defined functions to SQL when using SQLie3.'
  spec.description = 'Add some user-defined functions to SQL when using SQLie3.'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.metadata['rubygems_mfa_required'] = 'true'
end
