# SQLite3ExtendFunction

Add some user-defined function to SQL when using SQLie3 with ActiveRecord.

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
gem 'sqlite3_extend_function', '~> 0.1'
```

And then execute:
```bash
$ bundle
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
