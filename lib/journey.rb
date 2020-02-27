require_relative "oyster_card"
require_relative "station"

class Journey

  FARE = 6

  attr_accessor :complete, :entry_station, :other_station

  def initialize(entry_info)
    @complete = complete
    @entry_station = entry_info[:entry_station]
    @other_station = other_station
  end

  def complete?
    true unless @entry_station && @other_station == false
  end

  def fare
    FARE
  end

  def finish(station)
    station = self
  end

end