require 'boris-bikes'

describe Bike do

  it 'new bikes always work' do
    expect(subject.working).to eq true
  end

end
