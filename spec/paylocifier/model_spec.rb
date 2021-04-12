RSpec.describe Paylocifier::Model do
  describe 'class' do
    subject { described_class }

    it { is_expected.to respond_to(:url) }
    it { is_expected.to respond_to(:id_alias) }
    it { is_expected.to respond_to(:associations) }

    class MockedModel < Paylocifier::Model; end

    before do
      allow_any_instance_of(Paylocifier::Client).to receive(:refresh_token!).and_return('1234')
    end

    describe '#endpoint' do
      it 'should set the endpoint for the model' do
        expect(MockedModel.url).to be(nil)

        MockedModel.endpoint :mocked_models

        expect(MockedModel.url).to be(:mocked_models)
      end
    end

    describe '#has_many' do
      it 'adds the association to the list of associations' do
        expect(MockedModel.associations).to be_empty

        MockedModel.has_many :earnings

        expect(MockedModel.associations).to include('earnings')
      end
    end

    describe '#id' do
      it 'should override the id alias from :id' do
        expect(MockedModel.id_alias).to be(:id)

        MockedModel.id :mocked_id

        expect(MockedModel.id_alias).to eq(:mocked_id)
        expect(MockedModel.new(mocked_id: 4).id).to eq(4)
      end
    end

    describe '#client' do
      it { expect(MockedModel.client).to be_a(Paylocifier::Client) }
    end

    describe '#all' do
      before do
        configure!
        allow_any_instance_of(Faraday::Connection).to receive(:get)
          .and_return(double(
            status: 200,
            body: [{ my_id: 1 }, { my_id: 2 }].to_json
          ))
      end

      it 'should fetch all resources from the API' do
        expect_any_instance_of(Faraday::Connection).to receive(:get).with('mocked_models')

        MockedModel.id :my_id
        resources = MockedModel.all

        expect(resources.count).to eq(2)
        expect(resources.first).to be_a(MockedModel)
        expect(resources.first.id).to eq(1)
      end
    end

    describe '#find' do
      before do
        configure!
        allow_any_instance_of(Faraday::Connection).to receive(:get)
          .and_return(double(status: 200, body: { my_id: 1 }.to_json))
      end

      it 'should fetch the resource denoted by `id` from the API' do
        expect_any_instance_of(Faraday::Connection).to receive(:get).with('mocked_models/1')

        MockedModel.id :my_id
        resource = MockedModel.find(1)

        expect(resource.my_id).to eq(1)
      end
    end
  end

  describe 'instance' do
    subject { described_class.new({ id: 1 }) }

    it { is_expected.to respond_to(:data) }

    describe '#new' do
      it 'uses a mash to make json accessible via method calls' do
        model = MockedModel.new(my_id: 1, name: 'Name')
        expect(model.name).to eq('Name')
      end
    end

    describe '#id_alias' do
      it 'aliases `id` to the id_alias' do
        MockedModel.id :my_new_id
        model = MockedModel.new(my_new_id: 1, name: 'Name')
        expect(model.id).to eq(1)
      end
    end

    describe 'associations' do
      before do
        configure!
        allow_any_instance_of(Faraday::Connection).to receive(:get)
          .and_return(double(status: 200, body: [{ dog_id: 1 }].to_json))
        allow_any_instance_of(Paylocifier::Client).to receive(:refresh_token!).and_return('1234')
      end

      class Paylocifier::Dog < Paylocifier::Model
        endpoint :dogs
        id :dog_id
      end

      it 'fetches the association resources from the API when association name is called and instantiates the model class' do
        MockedModel.has_many :dogs
        MockedModel.id :my_id

        model = MockedModel.new(my_id: 1)

        expect_any_instance_of(Faraday::Connection).to receive(:get).with('mocked_models/1/dogs')

        dogs = model.dogs

        expect(dogs).to be_a(Paylocifier::Collection)
        expect(dogs.count).to eq(1)
        expect(dogs.first).to be_a(Paylocifier::Dog)
        expect(dogs.first.id).to eq(1)
      end
    end
  end
end
