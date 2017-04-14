require './lib/docking_station'
require './lib/bike'

describe DockingStation do


  it 'Docking station responds to :release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'Docking station #dock to accept #bikes' do
    expect{subject.dock("TEST")}.to raise_error "You cannot dock that"
  end

  it 'responds to #bike' do
    expect(subject).to respond_to(:bike)
  end

  it 'No bikes raises error' do
   expect{subject.release_bike}.to raise_error "There are no working bikes"
  end

  it "dock will accept more than one bike" do
    subject.dock(Bike.new)
    expect{subject.dock(Bike.new)}.to_not raise_error
  end

  it "an instance of #bike can hold docked #status" do
    bike = Bike.new
    subject.dock(bike)
    expect(bike.status).to eq "docked"
  end

  it "a single instance of #bike cannot be docked twice" do
    bike = Bike.new
    subject.dock(bike)
    expect{subject.dock(bike)}.to raise_error "Bike already docked"
  end

  it "check docking station can have bikes" do
    expect(subject.bikes.class).to eq Array
  end

  it "dock can accept more than one bike" do
    subject.dock(Bike.new)
    expect(subject.bikes.count).to eq 1
    subject.dock(Bike.new)
    expect(subject.bikes.count).to eq 2
  end

  it 'dock releases a Bike from capacity' do
    subject.dock(Bike.new)
    expect(subject.bikes.count).to eq 1
    subject.release_bike
    expect(subject.bikes.count).to eq 0
  end

  it "cannot dock a bike if #bikes plus #broken_bikes is at #capacity" do
    halfcap = DockingStation::DEFAULT_CAPACITY/2
    halfcap.times {subject.dock Bike.new}
    halfcap.times {subject.dock Bike.new(false)}
    expect {subject.dock(Bike.new)}.to raise_error "Dock full"
  end

  it "new dock can take an argument for #capacity" do
      ds = DockingStation.new(14)
      expect(ds.capacity).to eq 14
  end

  it "new dock initializes with #DEFAULT_CAPACITY of 20" do
      expect(subject.capacity).to eq 20
  end

  it "check docking station can have broken bikes" do
    expect(subject.broken_bikes.class).to eq Array
  end

  it "working bikes go into #bikes" do
    b = Bike.new()
    subject.dock(b) if b.working
    expect(subject.bikes.count).to eq 1
  end

  it "broken bikes go into #broken_bikes" do
    b = Bike.new(false)
    subject.dock(b) if !b.working
    expect(subject.broken_bikes.count).to eq 1
  end

end

describe Bike do

  it 'new bikes always work' do
    expect(subject.working).to eq true
  end

  it 'bikes can be broken' do
    b = Bike.new(false)
    expect(subject.working).to eq true
  end

end
