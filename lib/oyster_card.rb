class OysterCard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail "Maximum balance of £#{MAX_BALANCE} exceeded" if value + balance > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "No credit on card" if balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    fail "Cannot touch out, not in journey" if @in_journey == false
    @in_journey = false
  end

end