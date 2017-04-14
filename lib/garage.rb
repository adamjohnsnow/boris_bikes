require_relative 'docking_station'

class Garage

attr_accessor :van

  def collect_bikes(docking_station)
    @van = docking_station.broken_bikes
    docking_station.broken_bikes = []
  end

  def return_bikes(docking_station)
    docking_station.bikes = van + docking_station.bikes
    @van = []
  end

  def fix_bikes
    van.each{|x| x.working = true}
  end

end
