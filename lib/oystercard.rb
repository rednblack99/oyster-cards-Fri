class Oystercard

  attr_reader :balance

  LIMIT = 90

  def initialize(balance = 0, state = false)
    @balance = balance
    @state = state
  end

  def topup(money)
    exceeding = @balance + money - LIMIT
    raise "Sorry, you have exceeded the limit by #{exceeding} pounds!" if money + @balance > LIMIT
    @balance += money
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @state = true if @balance > 0
  end

  def touch_out
    @state = false if @state == true
  end

  def in_journey?
    @state
  end

end
