class DockingStation

  attr_accessor :bike, :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def release_bike
      fail "There are no bikes" if empty?
      bikes.shift
  end

  def dock(bike)
   fail "Dock full" if full?
    bikes << bike
  end

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []

  end

  def default_capacity
    []
  end

private

def full?
  bikes.count == capacity ? true : false
end

def empty?
  bikes.count == 0 ? true : false
end

end

class Bike

  def working?
  end

end
