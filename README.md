# GitLabStatus
A simple gem to check average response time to <https://gitlab.com> or <https://about.gitlab.com> during one minute.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'git_lab_status'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git_lab_status

## Usage

To use as a CLI, run `rake install`, then run `git_lab_status` in the command-line to check <https://gitlab.com>. Accepts `about` as an argument for <https://about.gitlab.com>.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Folkman/git_lab_status.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
