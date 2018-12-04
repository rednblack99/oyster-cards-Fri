class Oystercard

  attr_reader :balance

  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def topup(money)
    exceeding = @balance + money - LIMIT
    raise "Sorry, you have exceeded the limit by #{exceeding} pounds!" if money + @balance > LIMIT
    @balance += money
  end

end
