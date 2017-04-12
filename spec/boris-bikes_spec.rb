require 'boris-bikes'



describe DockingStation do

  dockingstation = DockingStation.new
  bike = dockingstation.release_bike

  it 'Docking station respondes to :release_bike' do
    expect(dockingstation).to respond_to :release_bike
  end
  it 'Docking station repsonds_to to :working' do
    expect(bike).to respond_to :working?
  end
end
