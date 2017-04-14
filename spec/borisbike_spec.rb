require 'docking_station'

describe DockingStation do
let(:bike) { double :bike , working: true }

  it " creates an instance of DockingStation" do
    expect(DockingStation.new).to be_an_instance_of(DockingStation)
  end

  it {is_expected.to respond_to(:release_bike)}

  it 'expects docking_station to be initialized with an argument' do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:dock).with(1).argument
  end

  it 'expects docking_station to respond to the dock method' do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:dock)
  end

  it 'should raise an error when @bike = nil when releasing' do
    if @capacity == nil
      expect{subject.release_bike}.to raise_error("No working bikes available")
    end
  end

  it 'should raise an error when docked bikes = 20 and docking' do
    DockingStation::DEFAULT_CAPACITY.times do
    subject.dock(bike)
  end
    expect{subject.dock(bike)}.to raise_error("Dock full")
  end

  it "dock accepts argument to #capacity" do
    cap = 15
    ds = DockingStation.new(cap)
    ds.capacity == cap
  end

  it "#capacity is 20 when no agrument passed to new #docking_station" do
    expect(subject.capacity).to eq 20
  end



end
