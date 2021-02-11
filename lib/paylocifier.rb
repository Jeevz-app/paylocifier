require 'paylocifier/version'
require 'paylocifier/config'
require 'paylocifier/client'
require 'paylocifier/encryption'

require 'paylocifier/payroll'
require 'paylocifier/collection'
require 'paylocifier/models/employee'
require 'paylocifier/models/earning'
require 'paylocifier/models/deduction'

module Paylocifier
  class Error < StandardError; end

  def self.configure
    yield config
  end

  def self.config
    @@config ||= Paylocifier::Config.new
  end
end
