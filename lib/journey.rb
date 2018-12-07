require_relative 'oystercard'
require_relative 'station'

class Journey

  attr_reader :journey_status, :journey_stations

  MINIMUM = 1
  PENALTY_FARE = 6

  def initialize(entry_station, zone)
    @entry_station = entry_station
    @zone = zone
    @journey_stations = []
    @journey_status = true
  end

  def create_entry_station
    @entry_station = Station.new(@entry_station, @zone)
    @journey_stations << @entry_station.info
    @journey_status
  end

  def create_exit_station(exit_station, zone)
    @exit_station = Station.new(exit_station, zone)
    @journey_stations << @exit_station.info
    @journey_status = false
  end

  def fare
    @journey_stations.length == 1 ? PENALTY_FARE : MINIMUM
  end

end