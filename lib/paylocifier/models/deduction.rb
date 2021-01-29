require_relative '../model'

class Paylocifier::Deduction < Paylocifier::Model
  endpoint :deductions

  id :dcode

  legacy!

  create_method :post
end
