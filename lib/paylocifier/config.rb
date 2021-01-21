class Paylocifier::Config
  attr_accessor :client_id,
    :client_secret,
    :company_id,
    :host,
    :encryption_key_path,
    :encryption

  def initialize(
    client_id:            nil,
    client_secret:        nil,
    company_id:           nil,
    host:                 nil,
    encryption_key_path:  nil,
    encryption:           true
  )
    @client_id            = client_id
    @client_secret        = client_secret
    @company_id           = company_id
    @host                 = host
    @encryption_key_path  = encryption_key_path
    @encryption           = encryption
  end
end

