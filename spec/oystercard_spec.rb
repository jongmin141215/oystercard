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

  it 'deducts an amount from the balance' do
    oystercard.top_up(20)
    expect{ oystercard.deduct(3) }.to change{ oystercard.balance }.by -3
  end

  it 'is initially not in a journey' do
    expect(oystercard).not_to be_in_journey
  end

  it 'can touch in' do
    oystercard.touch_in
    expect(oystercard).to be_in_journey
  end

  it 'can touch out' do
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey
  end
end
