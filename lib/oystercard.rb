require_relative 'journey'
require_relative 'station'
 

class Oystercard

  attr_reader :balance, :journey_history, :in_transit

  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
    @journey_history = []
    @in_transit = false
  end

  def top_up(money)
    exceeding = @balance + money - LIMIT
    money + @balance > LIMIT ? raise("Sorry, you have exceeded the limit by #{exceeding} pounds!") : @balance += money
  end

  def touch_in(entry_station, zone)
    raise("Not enough money on card") if @balance < Journey::MINIMUM
    if @in_transit == true
      @balance -= @journey.fare
    end
    @journey = Journey.new(entry_station, zone)
    @in_transit = @journey.create_entry_station
  end

  def touch_out(exit_station, zone)
    raise("You haven't touched in") if @in_transit == false
    @journey.create_exit_station(exit_station, zone)
    @journey_history << @journey.journey_stations
    @balance -= @journey.fare
    @in_transit = false
  end

end

