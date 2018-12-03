class Oystercard

  attr_reader :balance

  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def topup(money)
    raise "Sorry, limit of #{Oystercard::LIMIT} exceeded!" if money + @balance > LIMIT
    @balance += money
  end

end
