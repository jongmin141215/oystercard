require 'oystercard'
describe Oystercard do
  subject(:oystercard) { Oystercard.new }
  it 'has balance of 0 when created' do
    expect(oystercard.balance).to eq 0
  end
end
