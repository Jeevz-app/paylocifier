class Paylocifier::Client
  attr_reader :config

  def initialize
    @config = Paylocifier.config
  end

  def post(url)
    connection.post(url) do |req|
      # req.params['limit'] = 100
      # req.body = {query: 'salmon'}.to_json
    end
  end

  def get(url)
    connection.get(url) do |req|
      # req.params['limit'] = 100
      # req.body = {query: 'salmon'}.to_json
    end
  end

  private

  def connection
    @connection ||= Faraday.new(
      url:      config.host,
      headers:  {
        'Content-Type': 'application/json'
      }
    )
  end
end
