# StringAttributes
String utility for ActiveRecord

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_attributes

## Usage

### Strip
strip attribute

```ruby
class User
  attr_string :name, strip: true
end

User.create(name: "hoge  ")
u = User.last
p u.name #=> "hoge"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/attribute-string.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

