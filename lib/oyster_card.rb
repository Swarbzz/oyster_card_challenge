class OysterCard
  
  MAX_BALANCE = 90
  MIN_CHARGE = 1

  attr_reader :balance, :in_use, :fare, :entry_station

  def initialize
    @balance = 0
    @fare = fare.to_i
    @in_use = false
    @entry_station = entry_station
  end

  def top_up(value)
    fail "Card maxed out" if value + balance > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    # @in_use
    !!entry_station
  end

  def touch_in(station)
    raise "No credit on card" if balance < MIN_CHARGE
    @in_use = true
  end

  def touch_out
    deduct(MIN_CHARGE)
    @in_journey = false
    @entry_station = nil
  end

  private

  def deduct(fee)
    @balance -= fee
  end
end