class Oystercard

  attr_reader :balance

  LIMIT = 90
  MINIMUM = 1

  def initialize(balance = 0, state = false)
    @balance = balance
    @state = state
  end

  def top_up(money)
    exceeding = @balance + money - LIMIT
    money + @balance > LIMIT ? raise("Sorry, you have exceeded the limit by #{exceeding} pounds!") : @balance += money
  end

  def touch_in
    @state = true
  end

  def touch_out
    deduct(MINIMUM)
    @state = false
  end

  def in_journey?
    @state
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
