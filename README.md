# Daffy

Dynamic null objects for nil ActiveRecord instances. Also builds out dynamic null objects for ActiveRecord relations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'daffy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daffy

## Usage

Include `Daffy` into whatever ActiveRecord class you would like to use it in. Daffy will return a "Null Object" that will respond to the different columns on the defined table. Currently it will only respond with defaults or the defined defaults in Daffy. Eventually you will be able to override on a case-by-case basis. Null relations will be added in future iterations.

More instructions coming soon :)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lollar/daffy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Daffy project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lollar/daffy/blob/master/CODE_OF_CONDUCT.md).
