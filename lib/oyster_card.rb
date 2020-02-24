class OysterCard

  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Card maxed out" if value + balance > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end
end