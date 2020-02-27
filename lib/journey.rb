require_relative "oyster_card"
require_relative "station"

class Journey

  FARE = 6

  attr_accessor :complete, :entry_station

  def initialize
    @complete = complete
    @entry_station = entry_station
  end

  def complete?
    false
  end

  def fare
    6
  end

  def finsh
  end

end