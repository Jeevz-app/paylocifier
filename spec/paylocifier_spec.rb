RSpec.describe Paylocifier do
  it 'has a version number' do
    expect(Paylocifier::VERSION).not_to be nil
  end

  it 'is configurable' do
    expect(Paylocifier.config.api_key).to be(nil)
    expect(Paylocifier.config.api_secret).to be(nil)
    expect(Paylocifier.config.host).to be(nil)

    Paylocifier.configure do |config|
      config.api_key = 'key'
      config.api_secret = 'secret'
      config.host = 'host'
    end

    expect(Paylocifier.config.api_key).to eq('key')
    expect(Paylocifier.config.api_secret).to eq('secret')
    expect(Paylocifier.config.host).to eq('host')
  end
end
