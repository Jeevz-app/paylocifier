RSpec.describe Paylocifier::Employee do
  describe 'instance' do
    subject { described_class.new(employee_id: 1, name: 'Trey Anastasio') }

    it { expect(subject.id).to eq(1) }
    it { expect(subject.name).to eq('Trey Anastasio') }

    it { is_expected.to have_many(:earnings) }
  end
end
