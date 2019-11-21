class Journey
  attr_accessor :entry_station, :exit_station
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
    'Journey has begun'
  end

  def finish(station)
    @exit_station = station
    'Journey has finished'
  end

  def fare
  return PENALTY_FARE if !entry_station || !exit_station
  MINIMUM_FARE
  end

  def complete?
  true if entry_station && exit_station
  end

end
