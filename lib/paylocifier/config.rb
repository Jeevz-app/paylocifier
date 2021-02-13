class Paylocifier::Config
  attr_accessor :client_id,
    :client_secret,
    :company_id,
    :host,
    :legacy_host,
    :encryption_key_path,
    :encryption,
    :payroll_host,
    :payroll_secret,
    :payroll_client_id,
    :payroll_token_endpoint

  def initialize(
    client_id:              nil,
    client_secret:          nil,
    company_id:             nil,
    host:                   nil,
    legacy_host:            nil,
    encryption_key_path:    nil,
    encryption:             true,
    payroll_host:           nil,
    payroll_secret:         nil,
    payroll_client_id:      nil,
    payroll_token_endpoint: nil
  )
    @client_id              = client_id
    @client_secret          = client_secret
    @company_id             = company_id
    @host                   = host
    @legacy_host            = legacy_host
    @encryption_key_path    = encryption_key_path
    @encryption             = encryption
    @payroll_host           = payroll_host
    @payroll_secret         = payroll_secret
    @payroll_client_id      = payroll_client_id
    @payroll_token_endpoint = payroll_token_endpoint
  end
end

