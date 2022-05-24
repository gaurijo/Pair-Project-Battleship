require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before :each do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it "exists" do
    expect(@board).to be_a(Board)
  end

  it "has attributes" do
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.keys.length).to eq 16
    expect(@board.cells.values.length).to eq 16
    expect(@board.cells["C2"]).to be_a(Cell)
  end

  it "can tell if the coordinates are valid" do
    expect(@board.valid_coordinate?("A1")).to eq true
    expect(@board.valid_coordinate?("D4")).to eq true
    expect(@board.valid_coordinate?("A5")).to eq false
    expect(@board.valid_coordinate?("E1")).to eq false
    expect(@board.valid_coordinate?("A22")).to eq false
  end

  it "can tell if the number of coordinates is equal to the length of ship" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq false
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq false
  end

  it "can make sure the coordinates are in consecutive order" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
  end

  it "can make sure coordinates are not diagonal" do
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
  end

 it "can tell if the placement of the ship is valid" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)

  it "can tell if the placement of the ship is valid" do
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it "can place a ship on the board" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    expect(cell_1.ship).to eq (@cruiser)
    expect(cell_2.ship).to eq (@cruiser)
    expect(cell_3.ship).to eq (@cruiser)
    expect(cell_3.ship).to eq (cell_2.ship)
  end

  it "can check if the ships overlap" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["A1", "B1"])
    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq false
  end

  it "can render the board" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    # expect(@board.render).to eq ("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")    
  end
end
