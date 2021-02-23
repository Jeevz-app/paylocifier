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
        file:                   file,
        AutoAcknowledge:        auto_acknowledge,
        'Calendar.PayPeriodBeginDate': '2021-02-14',
        'Calendar.PayPeriodEndDate':   '2021-02-20',
        'Calendar.CheckDate':          '2021-02-26',
      })
    end

    def get
    end
  end
end
