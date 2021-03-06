RSpec.describe Paylocifier::Collection do
  before do
    allow_any_instance_of(Paylocifier::Client).to receive(:refresh_token!).and_return('1234')
  end

  describe '#new' do
    let(:earning) { Paylocifier::Earning.new(earning_code: 1) }

    it 'requires data or model_class' do
      expect { described_class.new }.to raise_error(ArgumentError)
      expect { described_class.new(data: [earning]) }.to_not raise_error(ArgumentError)
      expect { described_class.new(data: [], model_class: Paylocifier::Earning) }.to_not raise_error(ArgumentError)
    end
  end

  it 'is enumberable' do
    expect(described_class).to include(Enumerable)
  end

  describe '#find' do
    let(:earning1) { Paylocifier::Earning.new(earning_code: 1, name: 'Earning 1') }
    let(:earning2) { Paylocifier::Earning.new(earning_code: 2, name: 'Earning 2') }

    it 'finds objects by id' do
      expect(described_class.new(data: [earning1, earning2]).find(2)).to eq(earning2)
    end

    it 'is not string/int dependent' do
      expect(described_class.new(data: [earning1, earning2]).find('2')).to eq(earning2)
    end
  end

  describe '#find!' do
    context 'when data is loaded' do
      let(:earning) { Paylocifier::Earning.new(earning_code: 1, name: 'Earning 1') }

      it 'should raise a NotFound error' do
        expect { described_class.new(data: [earning], model_class: Paylocifier::Earning).find!(2) }.to raise_error(
          Paylocifier::Collection::NotFound
        )
      end
    end

    context 'when data has not been fetched yet' do
    end
  end

  describe '#create' do
    let(:path) { '/employees/4/earnings' }
    let(:data) { { amount: 10 } }
    let(:instance) do
      described_class.new(
        data:         [],
        model_class:  Paylocifier::Earning,
        path:         path)
    end

    subject(:create) { instance.create(data) }

    before do
      configure!
      allow_any_instance_of(Faraday::Connection).to receive(:send)
        .and_return(double(status: 200, body: { id: 1 }.to_json))
    end

    it 'properly calls the api w/ the right nesting' do
      expect_any_instance_of(Faraday::Connection).to receive(:send).with(:put, path)

      create
    end
  end
end
