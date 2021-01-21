[![Build Status](https://jeevz.semaphoreci.com/badges/paylocifier/branches/main.svg)](https://jeevz.semaphoreci.com/projects/paylocifier)

# Paylocifier

Paylocifier is a Ruby gem built by Jeevz (Cardinal Fez Inc) to facilitate interacting with the Paylocity API.

## TODO

- Map the rest of the API models and associations
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

First, ensure you've configured the gem properly

## Encryption

By default Paylocity requires your payloads to be encrypted.  You can disable encryption when setting up your account.  If you did, set encryption to false in the config: `config.encryption = false`.

If you do, however, need encryption, you must supply a pem file to the config.  Paylocity by default gives you an xml file w/ RSA modulus and exponents.  You can convert this to PEM using [this converter](https://superdry.apphb.com/tools/online-rsa-key-converter).  Once you have your PEM file, supply it to the config: `config.encryption_key_path = 'path_to_file.pem'`.

This gem doesn't currently do any data validation on input as each Paylocity setup will have different configurations and requirements, so try to create some records and inspect the errors raised to see the required inputs.

### Employees

```ruby
Paylocifier::Employee.find(1) # find individual employee by id
Paylocifier::Employee.all # find all employees
Paylocifier::Employee.create(name: 'Trey Anastasio', ...) # create a new employee
```

### Earnings

```ruby
employee = Paylocifier::Employee.find(1)
employee.earnings.all # fetch all employee earnings
employee.earnings.create(amount: 10, ...) # create new earning for employee
```

Associations are lazy loaded by default, so calling `employee.earnings` will not fetch the data from the API.  You must call a method that acts on the data like `all` or Enumberable methods like `each` or `map`.

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
