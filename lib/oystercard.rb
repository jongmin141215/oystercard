class Oystercard
  attr_accessor :balance
  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance of #{BALANCE_LIMIT} exceeded" if balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail 'Insufficient balance' if balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
