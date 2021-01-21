RSpec.describe Paylocifier::Config do
  it 'does not require initialization params' do
    expect { described_class.new }.to_not raise_error
  end

  it 'accepts initialization params' do
    config = described_class.new(
      client_id:            '1234',
      client_secret:        '5678',
      company_id:           'abc',
      host:                 'myhost',
      encryption_key_path:  'key.pem',
      encryption:           false
    )

    expect(config.client_id).to           eq('1234')
    expect(config.client_secret).to       eq('5678')
    expect(config.company_id).to          eq('abc')
    expect(config.host).to                eq('myhost')
    expect(config.encryption_key_path).to eq('key.pem')
    expect(config.encryption).to          eq( false)
  end
end
