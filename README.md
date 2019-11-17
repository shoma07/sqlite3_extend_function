# SQLite3ExtendFunctions

Add some user-defined functions to SQL when using SQLie3 with Rails.

## Functions

- ceil
- floor

```
ActiveRecord::Base.connection.select_one("select ceil(0.1)")
=> {"ceil(0.1)"=>1}

ActiveRecord::Base.connection.select_one("select floor(1.1)")
=> {"floor(1.1)"=>1}
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sqlite3_extend_functions',
    git: 'https://github.com/shoma07/sqlite3_extend_functions.git',
    branch: 'master'
```

And then execute:
```bash
$ bundle
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).