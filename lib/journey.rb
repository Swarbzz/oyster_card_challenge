require_relative "oyster_card"
require_relative "station"

class Journey

  FARE = 6
  MIN_FARE = 1

  attr_accessor :entry_station, :exit_station

  def initialize(entry_info)
    @entry_station = entry_info[:entry_station]
    @exit_station
  end

  def complete?
    @exit_station
  end

  def fare
    if !complete?
      FARE
    else
      MIN_FARE
    end
  end

  def finish(station)
    @exit_station = station
    station = self
  end

end