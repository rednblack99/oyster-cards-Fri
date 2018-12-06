class Oystercard

  attr_reader :balance, :entry_station, :exit_station,  :journeys

  LIMIT = 90
  MINIMUM = 1

  def initialize(balance = 0, entry_station = nil )
    @balance = balance
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = {}
  end

  def top_up(money)
    exceeding = @balance + money - LIMIT
    money + @balance > LIMIT ? raise("Sorry, you have exceeded the limit by #{exceeding} pounds!") : @balance += money
  end

  def touch_in(entry_station)
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM)
    @exit_station = exit_station
    @journeys[entry_station] = @exit_station
    @entry_station = nil
    @journeys
  end

  def in_journey?
    @entry_station != nil ? true : false
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
