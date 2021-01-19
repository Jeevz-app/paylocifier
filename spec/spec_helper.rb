require 'bundler/setup'
require 'paylocifier'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def configure!
  Paylocifier.configure do |config|
    config.client_id      = 'client_id'
    config.client_secret  = 'secret'
    config.company_id     = 'id'
    config.host           = 'https://example.com'
  end
  Paylocifier::Client.class_variable_set(:@@access_token, 'abc')
end

RSpec::Matchers.define :have_many do |association|
  match do |model|
    model.send(:associations).include?(association.to_s)
  end
end
