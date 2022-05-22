require './lib/ship'

RSpec.describe Ship do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "exists" do
    expect(@cruiser).to be_a(Ship)
  end

  it "has attributes" do
    expect(@cruiser.name).to eq("Cruiser")
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.health).to eq(3)
  end

  it "can check if the ship is sunk" do
    expect(@cruiser.sunk?).to eq(false)
  end

  it "can take a hit and track its health" do
    @cruiser.hit
    expect(@cruiser.health).to eq(2)
    @cruiser.hit
    expect(@cruiser.health).to eq(1)
  end

  it "can check if ship is sunk after loses all health" do
    @cruiser.hit
    expect(@cruiser.health).to eq(2)
    @cruiser.hit
    expect(@cruiser.health).to eq(1)
    expect(@cruiser.sunk?).to eq(false)
    @cruiser.hit
    expect(@cruiser.sunk?).to eq(true)
  end
end
