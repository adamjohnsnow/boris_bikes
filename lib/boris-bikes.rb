class DockingStation

  attr_reader :bike, :capacity

  def release_bike
      fail "There are no bikes" if empty?
      capacity.shift
  end

  def dock(bike)
   fail "Dock full" if full?
    capacity << bike
  end

  def initialize
    @capacity = []
  end

private

def full?
  capacity.count == 20 ? true : false
end

def empty?
  capacity.count == 0 ? true : false
end

end

class Bike

  def working?
  end

end
