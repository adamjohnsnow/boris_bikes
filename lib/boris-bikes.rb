class DockingStation
#test

  def release_bike
      fail "There are no bikes" unless @bike
      @bike
  end

  def dock_bike(bike)
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
