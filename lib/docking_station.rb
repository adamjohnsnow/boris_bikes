require_relative 'bike'

class DockingStation

  attr_accessor :bike, :bikes, :capacity, :broken_bikes

  DEFAULT_CAPACITY = 20

  def release_bike
    raise "No working bikes available" if empty?
    bike = bikes[0]
    bikes.shift
  end

  def dock(bike)
p bike
    raise "Dock full" if full?
    bike.working ?   bikes << bike :  broken_bikes << bike
  end

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  private

  def full?
    (bikes.count + broken_bikes.count) == capacity ? true : false
  end

  def empty?
    bikes.count == 0 ? true : false
  end

end
