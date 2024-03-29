require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before :each do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "exists" do
    expect(@cell).to be_a(Cell)
  end

  it "has attributes" do
    expect(@cell.coordinate).to eq("B4")
    expect(@cell.ship).to eq(nil)
  end

  it "can check if it is empty" do
    expect(@cell.empty?).to eq(true)
  end

  it "can have a ship placed in itself" do
    @cell.place_ship(@cruiser)
    expect(@cell.ship).to eq(@cruiser)
    expect(@cell.empty?).to eq(false)
  end

  it "can tell if a ship has been fired upon" do
    @cell.place_ship(@cruiser)
    expect(@cell.fired_upon?).to eq false
    @cell.fire_upon
    expect(@cell.ship.health).to eq 2
    expect(@cell.fired_upon?).to eq true
  end

  it "can return a string representation of the cell when the board is printed" do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")

    expect(cell_1.render).to eq(".")
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")

    cell_2.place_ship(@cruiser)
    expect(cell_2.render(true)).to eq ("S")
    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    expect(@cruiser.sunk?).to eq false

    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to eq true
    expect(cell_2.render).to eq ("X")
  end
end
