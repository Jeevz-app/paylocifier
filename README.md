[![Build Status](https://jeevz.semaphoreci.com/badges/paylocifier/branches/main.svg)](https://jeevz.semaphoreci.com/projects/paylocifier)

# Paylocifier

Paylocifier is a Ruby gem built by Jeevz (Cardinal Fez Inc) to facilitate interacting with the Paylocity API.

## TODO

- Map the rest of the API models and associations
- Pagination support
- Model data validations

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paylocifier'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install paylocifier

In an initializer:

```ruby
Paylocifier.configure do |config|
  config.client_id = 'id'
  config.client_secret = 'secret'
  config.company_id = 'id'
  config.host = 'host'
end
```

## Usage

First, ensure you've configured the gem.

### Employees

```ruby
Paylocifier::Employee.find(1) # find individual employee by id
Paylocifier::Employee.all # find all employees
Paylocifier::Employee.create(name: 'Trey Anastasio', ...) # create a new employee
```

### Earnings

```ruby
employee = Paylocifier::Employee.find(1)
employee.earnings # fetch all employee earnings
employee.earnings.create(amount: 10, ...) # create new earning for employee
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Please include specs.  You can run `guard` to watch and autorun spec files.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Jeevz-app/paylocifier. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Jeevz-app/paylocifier/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Paylocifier project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Jeevz-app/paylocifier/blob/master/CODE_OF_CONDUCT.md).
