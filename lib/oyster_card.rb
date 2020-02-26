# require 'station'

class OysterCard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 1

  attr_reader :balance, :in_journey, :entry_station, :history

  def initialize
    @balance = 0
    @entry_station
    @history = []
  end

  def top_up(value)
    fail "Maximum balance of £#{MAX_BALANCE} exceeded" if value + balance > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "No credit on card" if balance < MIN_BALANCE
    in_journey?
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    history.push({entry_station: @entry_station, exit_station: station})
    @entry_station = nil
  end

  def deduct(value)
    @balance -= value
  end

end