require 'oystercard'
describe Oystercard do
  subject(:oystercard) { Oystercard.new }
  it 'has a balance of 0 when created' do
    expect(oystercard.balance).to eq 0
  end

  it 'can top up the balance' do
    oystercard.top_up(10)
    expect{ oystercard.top_up 10 }.to change{ oystercard.balance }.by 10
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::BALANCE_LIMIT
    oystercard.top_up(maximum_balance)
    expect{ oystercard.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end
end
