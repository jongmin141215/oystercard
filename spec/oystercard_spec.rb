require 'oystercard'
describe Oystercard do
  subject(:oystercard) { Oystercard.new }
  it 'has a balance of 0 when created' do
    expect(oystercard.balance).to eq 0
  end

  it 'can top up the balance' do
    expect{ oystercard.top_up 10 }.to change{ oystercard.balance }.by 10
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::BALANCE_LIMIT
    oystercard.top_up(maximum_balance)
    expect{ oystercard.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

  it 'is initially not in a journey' do
    expect(oystercard).not_to be_in_journey
  end

  it 'will not touch in if below minimum balance' do
    expect{ oystercard.touch_in('Aldgate') }.to raise_error 'Insufficient balance'
  end


  context '#touch_in' do
    let(:station) { double :station }
    before do
      oystercard.top_up(20)
      oystercard.touch_in(station)
    end

    it 'can touch in' do
      expect(oystercard).to be_in_journey
    end

    it 'can touch out' do
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

    it 'deducts money when touching out' do
      expect{ oystercard.touch_out }.to change{ oystercard.balance }.by -Oystercard::MINIMUM_CHARGE
    end

    it 'stores the entry station' do
      expect(oystercard.entry_station).to eq station
    end
  end



end
