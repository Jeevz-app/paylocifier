RSpec.describe Paylocifier do
  it 'has a version number' do
    expect(Paylocifier::VERSION).not_to be nil
  end

  it 'is configurable' do
    Paylocifier.configure do |config|
      config.client_id      = 'newid'
      config.client_secret  = 'newsecret'
      config.company_id     = 'compid'
      config.host           = 'https://api.com'
    end

    expect(Paylocifier.config.client_id).to     eq('newid')
    expect(Paylocifier.config.client_secret).to eq('newsecret')
    expect(Paylocifier.config.company_id).to    eq('compid')
    expect(Paylocifier.config.host).to          eq('https://api.com')
  end
end
