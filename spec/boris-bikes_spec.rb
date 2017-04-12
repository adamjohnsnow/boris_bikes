require 'boris-bikes'

describe DockingStation do

  dockingstation = DockingStation.new
  bike = dockingstation.release_bike

  it 'Docking station responds to :release_bike' do
    expect(dockingstation).to respond_to :release_bike
  end

  it 'Docking station repsonds_to to :working' do
    expect(bike).to respond_to :working?
  end

  it 'Docking station responds to :release_bike' do
    expect(dockingstation).to respond_to(:dock_bike).with(1).argument
  end

  it 'responds to #bike' do
    expect(dockingstation).to respond_to(:bike)
  end

  it 'returns bike instance on #bike' do
    dockingstation.dock_bike(bike)
    expect(dockingstation.bike).to eq bike
  end


end
