require 'active_support/inflector'
require 'active_support/core_ext/hash'
require 'hashie'
require 'stringio'
require 'csv'

require_relative 'client'
require_relative '../paylocifier'

class Paylocifier::Payroll
  class << self
    def client
      @client ||= Paylocifier::Client.new
    end

    def post(file:, begin_date:, end_date:, check_date:, auto_acknowledge: true)
      client.payroll_connection.post('payEntryImport', {
        file:                           file,
        AutoAcknowledge:                auto_acknowledge,
        'Calendar.PayPeriodBeginDate':  begin_date,
        'Calendar.PayPeriodEndDate':    end_date,
        'Calendar.CheckDate':           check_date,
      })
    end

    def get
    end
  end
end
