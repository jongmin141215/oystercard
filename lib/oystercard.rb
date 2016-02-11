class Oystercard
  attr_reader :balance, :entry_station
  BALANCE_LIMIT = 90
  MINIMUM_CHARGE = 1
  def initialize
    @balance = 0
    @entry_station
  end

  def top_up(amount)
    fail "Maximum balance of #{BALANCE_LIMIT} exceeded" if balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    fail 'Insufficient balance' if balance < MINIMUM_CHARGE
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
