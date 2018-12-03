class Oystercard

  attr_reader :balance

  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def topup(money)
    raise 'Sorry, limit exceeded!' if exceed_limit == true
    @balance += money
  end

  def exceed_limit
    @balance >= LIMIT ? true : false
  end

end
