class Paylocifier::Config
  attr_accessor :api_key, :api_secret, :host

  def initialize(api_key: nil, api_secret: nil, host: nil)
    @api_key     = api_key
    @api_secret  = api_secret
    @host        = host
  end
end

