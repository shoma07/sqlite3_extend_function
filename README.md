# SQLite3ExtendFunction

Add some user-defined function to SQL when using SQLite3.

## Functions

The following PostgreSQL functions are supported.

- acos
- ascii
- asin
- atan
- atan2
- bit\_length
- btrim
- cbrt
- ceil
- char\_length
- chr
- concat
- concat\_ws
- cos
- cot
- decode
- degrees
- div
- encode
- exp
- floor
- format
- initcap
- ln
- log
- md5
- mod
- now
- octet\_length
- pi
- power
- radians
- sign
- sin
- sqrt
- tan
- trunc
- width\_bucket

See [PostgreSQL Document](https://www.postgresql.org/docs/12/functions.html)

```ruby
# check
SQLite3::Database.include(SQLite3ExtendFunction)
db = SQLite3::Database.new(':memory:')

db.execute("select ceil(0.1)")[0][0]
=> 1

db.execute("select floor(1.1)")[0][0]
=> 1
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sqlite3_extend_function', '~> 0.3'

# main branch
gem 'sqlite3_extend_function',
    git: 'https://github.com/shoma07/sqlite3_extend_function.git',
    branch: 'main'
```

And then execute:
```bash
$ bundle
```

## Enable extend functions

```ruby
SQLite3::Database.include(SQLite3ExtendFunction)
```

## Add extend function

Extend function can be added by defining modules such as:

```ruby
module SQLite3ExtendFunction
  module Functions
    module FunctionName
      class << self
        def call(arg1)
          # ...
        rescue StandardError
          raise SQLite3::SQLException, 'error message'
        end
      end
    end
  end
end
```

Extend function name is "FunctionName" as the snake case.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
