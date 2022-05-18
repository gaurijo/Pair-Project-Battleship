require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it "exists" do
    cell = Cell.new("B4")
    expect(cell).to be_a(Cell)
  end

  it "has attributes" do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
    expect(cell.ship).to eq(nil)
  end

  it "can check if it is empty" do
    cell = Cell.new("B4")
    expect(cell.empty?).to eq(true)
  end

  it "can have a ship placed in itself" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end

  it "can tell if a ship has been fired upon" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to eq false
    cell.fire_upon
    expect(cell.ship.health).to eq 2
    expect(cell.fired_upon?).to eq true
  end
end
