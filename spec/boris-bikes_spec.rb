require 'boris-bikes'

describe DockingStation do

  bike = Bike.new

  it 'Docking station responds to :release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'Docking station repsonds_to to :working' do
    expect(bike).to respond_to :working?
  end

  it 'Docking station responds to :release_bike' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'responds to #bike' do
    expect(subject).to respond_to(:bike)
  end

  it 'returns bike instance on #bike' do
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  it 'No bikes raises error' do
   expect{subject.release_bike}.to raise_error "There are no bikes"
  end

  it "dock will not accept more than one bike" do
    subject.dock(Bike.new)
    expect{subject.dock(Bike.new)}.to raise_error "Bike already docked"
  end
end
