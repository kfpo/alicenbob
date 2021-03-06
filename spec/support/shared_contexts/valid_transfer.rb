# frozen_string_literal: true

shared_context 'valid transfer' do |account_class = Account|
  let(:alice) { account_class.create(name: 'Alice', balance: 100) }
  let(:bob) { account_class.create(name: 'Bob', balance: 100) }

  before do
    described_class.call(bob, alice, 100)
  end

  it 'Bob`s balance = 0, Alice`s balance = 200' do
    aggregate_failures do
      expect(bob.reload.balance).to be_zero
      expect(alice.reload.balance).to eq 200
    end
  end
end
