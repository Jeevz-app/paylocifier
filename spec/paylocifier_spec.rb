RSpec.describe Paylocifier do
  it 'has a version number' do
    expect(Paylocifier::VERSION).not_to be nil
  end

  it 'is configurable' do
    Paylocifier.configure do |config|
      config.client_id            = 'newid'
      config.client_secret        = 'newsecret'
      config.company_id           = 'compid'
      config.host                 = 'https://api.com'
      config.encryption           = false
      config.encryption_key_path  = 'key.pem'
    end

    expect(Paylocifier.config.client_id).to           eq('newid')
    expect(Paylocifier.config.client_secret).to       eq('newsecret')
    expect(Paylocifier.config.company_id).to          eq('compid')
    expect(Paylocifier.config.host).to                eq('https://api.com')
    expect(Paylocifier.config.encryption).to          eq(false)
    expect(Paylocifier.config.encryption_key_path).to eq('key.pem')
  end
end
