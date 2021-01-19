RSpec.describe Paylocifier::Earning do
  describe 'instance' do
    subject { described_class.new(earning_code: 1, amount: 10) }

    it { expect(subject.id).to eq(1) }
    it { expect(subject.amount).to eq(10) }
  end
end
