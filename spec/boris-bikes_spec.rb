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

  it 'No bikes raises error' do
   expect{subject.release_bike}.to raise_error "There are no bikes"
  end

  it "dock will accept more than one bike" do
    subject.dock(Bike.new)
    expect{subject.dock(Bike.new)}.to_not raise_error "Bike already docked"
  end

  it "check docking station can have capacity" do
    expect(subject.capacity.class).to eq Array
  end

  it "dock can accept more than one bike" do
    subject.dock(Bike.new)
    expect(subject.capacity.count).to eq 1
    subject.dock(Bike.new)
    expect(subject.capacity.count).to eq 2
  end

  it 'dock releases a Bike from capacity' do
    subject.dock(Bike.new)
    expect(subject.capacity.count).to eq 1
    subject.release_bike
    expect(subject.capacity.count).to eq 0
  end

  it "cannot dock a bike if #capacity has 20 bikes" do
    20.times {subject.dock Bike.new}
    expect {subject.dock(Bike.new)}.to raise_error "Dock full"
  end
end
