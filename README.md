# sensu-plugin-sidekiq-latency

This is a Sensu plugin that allows monitoring and alerting if the latency of
a Sidekiq queue exceeds a threshold value. It talks directly to Redis, so that
it doesn't need to authenticate to the Sidekiq web interface.

# Installation

Or install it yourself as:

    $ gem install sensu-plugin-sidekiq-latency

# Functionality

## check-sidekiq-latency.rb
Checks the latency for a particular sidekiq queue, and warns if it exceeds thresholds.

- `--url` or `-u` - **required** URL of the Redis instance that Sidekiq is using.
- `--queue` or `-q` - **required** name of the sidekiq queue to monitor.
- `--warn` or `-w` - threshold (in seconds) for a warning to be issued.
- `--crit` or `-c` - threshold (in seconds) for a critical alert to be sent.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sensu-plugin-sidekiq-latency. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.
