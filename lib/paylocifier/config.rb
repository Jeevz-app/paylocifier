class Paylocifier::Config
  attr_accessor :client_id,
    :client_secret,
    :company_id,
    :host

  def initialize(
    client_id:      nil,
    client_secret:  nil,
    company_id:     nil,
    host:           nil
  )
    @client_id      = client_id
    @client_secret  = client_secret
    @company_id     = company_id
    @host           = host
  end
end

