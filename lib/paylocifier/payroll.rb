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

    # def post_test
    #   csv = CSV.generate(headers: false) do |data|
    #     data << ['999621057','E','BONUS',nil,10.50]
    #   end

    #   temp_file = Tempfile.new 'payroll', '/tmp'
    #   temp_file.write csv
    #   temp_file.rewind

    #   file      = Faraday::UploadIO.new(temp_file, 'text/plain')

    #   client.payroll_connection.post('payEntryImport', {
    #     file:                   file,
    #     AutoAcknowledge:        true,
    #     'Calendar.PayPeriodBeginDate': '2021-02-14',
    #     'Calendar.PayPeriodEndDate':   '2021-02-20',
    #     'Calendar.CheckDate':          '2021-02-26',
    #   })
    # end

    def get
    end
  end
end
