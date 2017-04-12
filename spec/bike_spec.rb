require 'boris-bikes'

describe Bike do
  it 'Bike repsonds_to :working?' do bike = Bike.new
    expect(bike).to respond_to :working?
  end
end
