# SQLite3ExtendFunction

Add some user-defined function to SQL when using SQLie3.

## Functions

The following PostgreSQL functions are supported.

- cbrt
- ceil
- degrees
- div
- exp
- floor
- ln
- log
- mod
- pi
- power
- radians
- sign
- sqrt
- trunc

See [PostgreSQL Document](https://www.postgresql.org/docs/12/functions-math.html#FUNCTIONS-MATH-FUNC-TABLE)

```
# check
db = SQLite3::Database.new(':memory:')

db.execute("select ceil(0.1)")[0][0]
=> 1

db.execute("select floor(1.1)")[0][0]
=> 1
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sqlite3_extend_function', '~> 0.1'

# master branch
gem 'sqlite3_extend_function',
    git: 'https://github.com/shoma07/sqlite3_extend_function.git',
    branch: 'master'
```

And then execute:
```bash
$ bundle
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
