require_relative "journey"

class OysterCard
  
  MAX_BALANCE = 90
  MIN_CHARGE = 1

  attr_reader :balance, :in_use, :entry_station, :history, :journey

  def initialize
    @balance = 0
    @in_use = false
    @entry_station = entry_station
    @history = []
    @journey = nil
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
    @journey = Journey.new(entry_station: station)
    @in_use = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    @history << { in: entry_station, exit: station }
    @entry_station = nil
    @exit_station = station
  end

  private

  def deduct(fee)
    @balance -= fee
  end
end
