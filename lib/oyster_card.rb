class OysterCard
  
  MAX_BALANCE = 90
  MIN_CHARGE = 1

  attr_reader :balance, :in_use, :fare

  def initialize
    @balance = 0
    @fare = fare.to_i
    @in_use = false
  end

  def top_up(value)
    fail "Card maxed out" if value + balance > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    @in_use
  end

  def touch_in
    if @balance >= MIN_CHARGE
      @in_use = true
    else
      raise "No credit on card"
    end
  end

  def touch_out
    deduct(MIN_CHARGE)
    @in_journey = false
  end

  private

  def deduct(fee)
    @balance -= fee
  end
end