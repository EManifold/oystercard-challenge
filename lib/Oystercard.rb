class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil

  end

  def top_up(amount)
    raise "Balance limit is £#{BALANCE_LIMIT}" if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise "Insufficient funds" if balance < MINIMUM_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
     deduct(MINIMUM_FARE)
     @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
