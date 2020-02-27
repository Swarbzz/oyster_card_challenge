require_relative "journey"
require_relative "JourneyLog"
require_relative "station"

class OysterCard
  
  MAX_BALANCE = 90
  MIN_CHARGE = 1

  attr_reader :balance, :in_use, :entry_station, :history, :journey 

  def initialize
    @balance = 0
    @in_use = false
    @entry_station = entry_station
    @history = []
    @journey = Journey.new(entry_station: entry_station)
  end

  def top_up(value)
    fail "Card maxed out" if value + balance > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    raise "No credit on card" if balance < MIN_CHARGE
    @journey = JourneyLog.new
    @in_use = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(journey.fare)
    @history << { in: entry_station, exit: station }
    @entry_station = nil
    @exit_station = station
  end

  private

  def deduct(fee)
    @balance -= fee
  end
end
