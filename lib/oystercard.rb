class Oystercard

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def topup(money)
    @balance += money
  end

end
