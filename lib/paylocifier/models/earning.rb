require_relative '../model'

class Paylocifier::Earning < Paylocifier::Model
  endpoint :earnings

  id :earning_code

  create_method :put
end

# employeeId + companyId required
# {
#   "agency": "Unknown Type: string,null",
#   "amount": "Unknown Type: number,null",
#   "annualMaximum": "Unknown Type: number,null",
#   "calculationCode": "Unknown Type: string,null",
#   "costCenter1": "Unknown Type: string,null",
#   "costCenter2": "Unknown Type: string,null",
#   "costCenter3": "Unknown Type: string,null",
#   "earningCode": "Unknown Type: string,null",
#   "effectiveDate": "Unknown Type: string,null",
#   "endDate": "Unknown Type: string,null",
#   "frequency": "Unknown Type: string,null",
#   "goal": "Unknown Type: number,null",
#   "hoursOrUnits": "Unknown Type: number,null",
#   "isSelfInsured": "Unknown Type: boolean,null",
#   "jobCode": "Unknown Type: string,null",
#   "miscellaneousInfo": "Unknown Type: string,null",
#   "paidTowardsGoal": "Unknown Type: number,null",
#   "payPeriodMaximum": "Unknown Type: number,null",
#   "payPeriodMinimum": "Unknown Type: number,null",
#   "rate": "Unknown Type: number,null",
#   "rateCode": "Unknown Type: string,null",
#   "startDate": "Unknown Type: string,null"
# }
