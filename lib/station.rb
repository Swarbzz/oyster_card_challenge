require_relative "oyster_card"
require_relative "journey"

class Station

attr_reader :name, :zone

def initialize(station_info)
  @name = "Liverpool Street"
  @zone = 1
end

end