require_relative 'Journey'

class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :journey_history

  def initialize(journey = Journey.new)
    @balance = 0
    @journey_history = []
    @journey = journey
  end

  def top_up(amount)
    raise "Balance limit is £#{BALANCE_LIMIT}" if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if balance < MINIMUM_FARE
    @journey.start(station)
  end

  def touch_out(station)
     deduct(MINIMUM_FARE)
     @journey.finish(station)
     @journey_history.push({entry_station: @journey.entry_station, exit_station: @journey.exit_station})
  end


  private

  def deduct(amount)
    @balance -= amount
  end

end
