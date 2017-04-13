class DockingStation
#test

  def release_bike
      fail "There are no bikes" unless @bike
      @bike
  end

  def dock(bike)
    fail "Bike already docked" unless @bike == nil
    @bike = bike
  end

  def bike
    @bike
  end

end

class Bike

  def working?
  end

end
