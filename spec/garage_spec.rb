require 'garage'

describe Garage do

  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike }

  it "responds to #collect_bikes" do
    expect(subject).to respond_to(:collect_bikes)

  end

  it "responds to #return_bikes" do
    expect(subject).to respond_to(:return_bikes)

  end

  it "responds to #fix_bikes" do
    expect(subject).to respond_to(:fix_bikes)

  end

  it "collect #broken_bikes from #docking_station" do
    allow(docking_station).to receive(:broken_bikes).and_return(bike)
    expect(subject.collect_bikes(docking_station)).to eq docking_station.broken_bikes
  end

  it "returns #bikes to #docking_station" do
    allow(bike).to receive(:working).and_return("true")
   subject.van = [bike, bike]
   allow(docking_station).to receive(:bikes)
   subject.return_bikes(docking_station)
   expect(docking_station.bikes).to eq [bike, bike]

  end

end
