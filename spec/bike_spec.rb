require 'bike'

describe Bike do

  it "has the ability to make broken #bikes" do
    bike = Bike.new(false)
    expect(bike.working).to eq false
  end

  it 'new #bikes default to #working is true' do
    expect(subject.working).to eq true
  end
end
