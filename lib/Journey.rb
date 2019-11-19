class Journey

  attr_accessor :entry_station, :exit_station

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
  end

  def complete?

  end
end
