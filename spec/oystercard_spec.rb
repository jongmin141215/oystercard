require 'oystercard'
describe Oystercard do
  subject(:oystercard) { Oystercard.new }
  it 'has a balance of 0 when created' do
    expect(oystercard.balance).to eq 0
  end

  it 'can top up money' do
    oystercard.top_up(10)
    expect{ oystercard.top_up 10 }.to change{ oystercard.balance }.by 10
    # expect(oystercard.balance).to eq 10
  end
end
