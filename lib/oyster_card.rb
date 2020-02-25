class OysterCard
  
  MAX_BALANCE = 90
  MIN_CHARGE = 1

  attr_reader :balance, :in_use, :fare, :entry_station, :history

  def initialize
    @balance = 0
    @fare = fare.to_i
    @in_use = false
    @entry_station = entry_station
    @history = []
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
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    @history << { in: entry_station, exit: station }
    @entry_station = nil
  end

  private

  def deduct(fee)
    @balance -= fee
  end
end
