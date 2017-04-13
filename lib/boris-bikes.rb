class DockingStation

  attr_reader :bike, :capacity

  def release_bike
      fail "There are no bikes" if @capacity.count == 0
      @capacity.shift
  end

  def dock(bike)
   fail "Dock full" if capacity.count == 20
    capacity << bike
  end

  def initialize
    @capacity = []
  end


end

class Bike

  def working?
  end

end
