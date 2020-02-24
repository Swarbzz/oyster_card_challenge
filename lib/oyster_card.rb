class OysterCard

  MAX_BALANCE = 90

  attr_reader :balance, :in_use

  def initialize
    @balance = 0
    @in_use = in_use
  end

  def top_up(value)
    fail "Card maxed out" if value + balance > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    fail "You haven't touched in" unless in_use
  end

  def touch_in
    fail "No credit on card" if balance == 0
  end

end