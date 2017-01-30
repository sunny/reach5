# Reach5

Ruby Gem to integrate to the Reach5 Customer Identity Management Platform.


## Usage

```rb
Reach5::API.new.post_login(
  provider: "facebook",
  provider_token: "f00b4r",
  user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) …",
)
```

## Installation

Add these lines to your application's Gemfile:

```rb
# Reach5 Customer Identity Management Platform API
gem "reach5", git: "https://github.com/sunny/reach5"
```

And then execute:

    $ bundle


## Configuration

```rb
Reach5.configure do |c|
  c.customer_domain = "YOUR_CUSTOMER_DOMAIN"
  c.client_key = "YOUR_CLIENT_KEY"
  c.client_secret = "YOUR_SECRET_ACCESS_TOKEN"
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake` to run the specs and style checker.

You can also run `bin/console` for an interactive prompt that will allow you
to experiment. You can place your configuration in the untracked `./console.rb`
file to have it loaded whenever you load the console.

To release a new version, update the version number in `version.rb`, update the
`CHANGELOG.md` and then run `bundle exec rake release`, which will create a git
tag for the version, push git commits and tags, and push the `.gem` file
to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/sunny/reach5. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

