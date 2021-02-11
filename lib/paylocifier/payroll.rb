require 'active_support/inflector'
require 'active_support/core_ext/hash'
require 'hashie'

require_relative 'client'
require_relative '../paylocifier'

class Paylocifier::Payroll
  class << self
    def client
      @client ||= Paylocifier::Client.new
    end

    def post
      client.payroll_connection.post('payEntryImport', {
        # File: {},
        # Calendar: {
        #   CheckDate: Date.today.iso8601,
        # }
      }.to_json)
    end
  end
end


# EMPLOYEE ID (required)	""E" for Earnings
# "D" for Deduction
# DET (required)"	DETCODE (required)	HOURS	AMOUNT	TEMP RATE	RATECODE	COST CENTER 1	COST CENTER 2	COST CENTER 3	LEAVE BLANK	LEAVE BLANK	JOBCODE	SHIFT	BEGIN DATE (PUNCH IN)	END DATE (PUNCH OUT)	WORKERS COMP CODE	TCODE1 (STATE OVERRIDE)	TCODE2 (LOCAL1 OVERRIDE)	TCODE3 (LOCAL2 OVERRIDE)	TCODE4 (DO NOT USE)	SEQUENCE	CHECKTYPE	CHECK NUMBER
