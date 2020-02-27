require_relative "oyster_card"
require_relative "journey"
require_relative "station"

class JourneyLog 

  attr_accessor :journey_class, :journeys

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    journey_class.new(entry_station: station)
  end

  def finish
    journey_class.new(exit_station: station)
  end

  def journeys
    @journeys.dup
  end

  private

  def current_journey
    @current_journey ||= journey_class.new
  end

end