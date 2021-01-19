require_relative '../model'

class Paylocifier::Employee < Paylocifier::Model
  endpoint :employees

  id :employee_id

  has_many :earnings
end

# {
#   "additionalDirectDeposit": [
#     {
#       "accountNumber": "string",
#       "accountType": "string",
#       "amount": 0,
#       "amountType": "string",
#       "blockSpecial": true,
#       "isSkipPreNote": true,
#       "nameOnAccount": "string",
#       "preNoteDate": "string",
#       "routingNumber": "string"
#     }
#   ],
#   "additionalRate": [
#     {
#       "changeReason": "string",
#       "costCenter1": "string",
#       "costCenter2": "string",
#       "costCenter3": "string",
#       "effectiveDate": "string",
#       "endCheckDate": "string",
#       "job": "string",
#       "rate": 0,
#       "rateCode": "string",
#       "rateNotes": "string",
#       "ratePer": "string",
#       "shift": "string"
#     }
#   ],
#   "benefitSetup": {
#     "benefitClass": "string",
#     "benefitClassEffectiveDate": "string",
#     "benefitSalary": 0,
#     "benefitSalaryEffectiveDate": "string",
#     "doNotApplyAdministrativePeriod": true,
#     "isMeasureAcaEligibility": true
#   },
#   "birthDate": "string",
#   "companyFEIN": "string",
#   "companyName": "string",
#   "currency": "string",
#   "customBooleanFields": [
#     {
#       "category": "PayrollAndHR",
#       "label": "string",
#       "value": true
#     }
#   ],
#   "customDateFields": [
#     {
#       "category": "PayrollAndHR",
#       "label": "string",
#       "value": "string"
#     }
#   ],
#   "customDropDownFields": [
#     {
#       "category": "PayrollAndHR",
#       "label": "string",
#       "value": "string"
#     }
#   ],
#   "customNumberFields": [
#     {
#       "category": "PayrollAndHR",
#       "label": "string",
#       "value": 0
#     }
#   ],
#   "customTextFields": [
#     {
#       "category": "PayrollAndHR",
#       "label": "string",
#       "value": "string"
#     }
#   ],
#   "departmentPosition": {
#     "changeReason": "string",
#     "clockBadgeNumber": "string",
#     "costCenter1": "string",
#     "costCenter2": "string",
#     "costCenter3": "string",
#     "effectiveDate": "string",
#     "employeeType": "string",
#     "equalEmploymentOpportunityClass": "string",
#     "isMinimumWageExempt": true,
#     "isOvertimeExempt": true,
#     "isSupervisorReviewer": true,
#     "isUnionDuesCollected": true,
#     "isUnionInitiationCollected": true,
#     "jobTitle": "string",
#     "payGroup": "string",
#     "positionCode": "string",
#     "reviewerCompanyNumber": "string",
#     "reviewerEmployeeId": "string",
#     "shift": "string",
#     "supervisorCompanyNumber": "string",
#     "supervisorEmployeeId": "string",
#     "tipped": "string",
#     "unionAffiliationDate": "string",
#     "unionCode": "string",
#     "unionPosition": "string",
#     "workersCompensation": "string"
#   },
#   "disabilityDescription": "string",
#   "emergencyContacts": [
#     {
#       "address1": "string",
#       "address2": "string",
#       "city": "string",
#       "country": "string",
#       "county": "string",
#       "email": "string",
#       "firstName": "string",
#       "homePhone": "string",
#       "lastName": "string",
#       "mobilePhone": "string",
#       "notes": "string",
#       "pager": "string",
#       "primaryPhone": "string",
#       "priority": "string",
#       "relationship": "string",
#       "state": "string",
#       "syncEmployeeInfo": true,
#       "workExtension": "string",
#       "workPhone": "string",
#       "zip": "string"
#     }
#   ],
#   "employeeId": "string",
#   "ethnicity": "string",
#   "federalTax": {
#     "amount": 0,
#     "deductionsAmount": 0,
#     "dependentsAmount": 0,
#     "exemptions": 0,
#     "filingStatus": "string",
#     "higherRate": true,
#     "otherIncomeAmount": 0,
#     "percentage": 0,
#     "taxCalculationCode": "string",
#     "w4FormYear": 0
#   },
#   "firstName": "string",
#   "gender": "string",
#   "homeAddress": {
#     "address1": "string",
#     "address2": "string",
#     "city": "string",
#     "country": "string",
#     "county": "string",
#     "emailAddress": "string",
#     "mobilePhone": "string",
#     "phone": "string",
#     "postalCode": "string",
#     "state": "string"
#   },
#   "isHighlyCompensated": true,
#   "isSmoker": true,
#   "lastName": "string",
#   "localTax": [
#     {
#       "exemptions": 0,
#       "exemptions2": 0,
#       "filingStatus": "string",
#       "residentPSD": "string",
#       "taxCode": "string",
#       "workPSD": "string"
#     }
#   ],
#   "mainDirectDeposit": {
#     "accountNumber": "string",
#     "accountType": "string",
#     "blockSpecial": true,
#     "isSkipPreNote": true,
#     "nameOnAccount": "string",
#     "preNoteDate": "string",
#     "routingNumber": "string"
#   },
#   "maritalStatus": "string",
#   "middleName": "string",
#   "nonPrimaryStateTax": {
#     "amount": 0,
#     "deductionsAmount": 0,
#     "dependentsAmount": 0,
#     "exemptions": 0,
#     "exemptions2": 0,
#     "filingStatus": "string",
#     "higherRate": true,
#     "otherIncomeAmount": 0,
#     "percentage": 0,
#     "reciprocityCode": "string",
#     "specialCheckCalc": "string",
#     "taxCalculationCode": "string",
#     "taxCode": "string",
#     "w4FormYear": 0
#   },
#   "ownerPercent": 0,
#   "preferredName": "string",
#   "primaryPayRate": {
#     "annualSalary": 0,
#     "baseRate": 0,
#     "beginCheckDate": "string",
#     "changeReason": "string",
#     "defaultHours": 0,
#     "effectiveDate": "string",
#     "isAutoPay": true,
#     "payFrequency": "string",
#     "payGrade": "string",
#     "payRateNote": "string",
#     "payType": "string",
#     "ratePer": "string",
#     "salary": 0
#   },
#   "primaryStateTax": {
#     "amount": 0,
#     "deductionsAmount": 0,
#     "dependentsAmount": 0,
#     "exemptions": 0,
#     "exemptions2": 0,
#     "filingStatus": "string",
#     "higherRate": true,
#     "otherIncomeAmount": 0,
#     "percentage": 0,
#     "specialCheckCalc": "string",
#     "taxCalculationCode": "string",
#     "taxCode": "string",
#     "w4FormYear": 0
#   },
#   "priorLastName": "string",
#   "salutation": "string",
#   "ssn": "string",
#   "status": {
#     "adjustedSeniorityDate": "string",
#     "changeReason": "string",
#     "effectiveDate": "string",
#     "employeeStatus": "string",
#     "hireDate": "string",
#     "isEligibleForRehire": true,
#     "reHireDate": "string"
#   },
#   "suffix": "string",
#   "taxSetup": {
#     "fitwExemptNotes": "string",
#     "fitwExemptReason": "string",
#     "futaExemptNotes": "string",
#     "futaExemptReason": "string",
#     "isEmployee943": true,
#     "isPension": true,
#     "isStatutory": true,
#     "medExemptNotes": "string",
#     "medExemptReason": "string",
#     "sitwExemptNotes": "string",
#     "sitwExemptReason": "string",
#     "ssExemptNotes": "string",
#     "ssExemptReason": "string",
#     "suiExemptNotes": "string",
#     "suiExemptReason": "string",
#     "suiState": "string",
#     "taxDistributionCode1099R": "string",
#     "taxForm": "string"
#   },
#   "veteranDescription": "string",
#   "webTime": {
#     "badgeNumber": "string",
#     "chargeRate": 0,
#     "isTimeLaborEnabled": true
#   },
#   "workAddress": {
#     "address1": "string",
#     "address2": "string",
#     "city": "string",
#     "country": "string",
#     "county": "string",
#     "emailAddress": "string",
#     "location": "string",
#     "mailStop": "string",
#     "mobilePhone": "string",
#     "pager": "string",
#     "phone": "string",
#     "phoneExtension": "string",
#     "postalCode": "string",
#     "state": "string"
#   },
#   "workEligibility": {
#     "alienOrAdmissionDocumentNumber": "string",
#     "attestedDate": "string",
#     "countryOfIssuance": "string",
#     "foreignPassportNumber": "string",
#     "i94AdmissionNumber": "string",
#     "i9DateVerified": "string",
#     "i9Notes": "string",
#     "isI9Verified": true,
#     "isSsnVerified": true,
#     "ssnDateVerified": "string",
#     "ssnNotes": "string",
#     "visaType": "string",
#     "workAuthorization": "string",
#     "workUntil": "string"
#   }
# }
