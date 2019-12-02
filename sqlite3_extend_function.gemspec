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
  spec.summary     = "Add some user-defined functions to SQL when using SQLie3 with Rails."
  spec.description = "Add some user-defined functions to SQL when using SQLie3 with Rails."
  spec.license     = "MIT"

  spec.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'activerecord', '~> 5'

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-rails"
end
