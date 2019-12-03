$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "sqlite3_extend_function/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "sqlite3_extend_function"
  spec.version     = SQLite3ExtendFunction::VERSION
  spec.authors     = ["shoma07"]
  spec.email       = ["23730734+shoma07@users.noreply.github.com"]
  spec.homepage    = "https://github.com/shoma07/sqlite3_extend_function"
  spec.required_ruby_version = ">= 2"
  spec.summary     = "Add some user-defined functions to SQL when using SQLie3."
  spec.description = "Add some user-defined functions to SQL when using SQLie3."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"

  spec.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "sqlite3", ">= 1.3"

  spec.add_development_dependency "rspec"
end
