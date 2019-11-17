$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "sqlite3_functions/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "sqlite3_functions"
  spec.version     = Sqlite3Functions::VERSION
  spec.authors     = ["shoma07"]
  spec.email       = ["23730734+shoma07@users.noreply.github.com"]
  spec.homepage    = "https://github.com/shoma07/sqlite3_functions"
  spec.summary     = "Summary of Sqlite3Functions."
  spec.description = "Description of Sqlite3Functions."
  spec.license     = "MIT"

  spec.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6"

  spec.add_development_dependency "sqlite3"
end
