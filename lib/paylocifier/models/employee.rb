require_relative '../model'

class Paylocifier::Employee < Paylocifier::Model
  endpoint :employees

  id :employee_id

  has_many :earnings
  has_many :deductions
end
