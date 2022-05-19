require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do

  it "exists" do
    board = Board.new
    expect(board).to be_a(Board)
  end

  it "has attributes" do
    board = Board.new
    expect(board.cells).to be_a(Hash)
    expect(board.cells.keys.length).to eq 16
    expect(board.cells.values.length).to eq 16
    expect(board.cells["C2"]).to be_a(Cell)
  end

  it "can tell if the coordinates are valid" do
    board = Board.new
    board.cells["A1"]
    board.cells["D4"]
    expect(board.valid_coordinate?).to eq(true)
    board.cells["A5"]
    expect(board.valid_coordinate?).to eq(false)
    board.cells["E1"]
    expect(board.valid_coordinate?).to eq(false)
    board.cells["A22"]
    expect(board.valid_coordinate?).to eq(false)
  end

  it "can tell if the placement of the ship is valid" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board.cells["A1, A2"]
    expect(board.valid_coordinate?.count).to eq(2)
    expect(board.valid_placement?(cruiser,["A1", "A2"])).to eq(false)
    board.cells["A2", "A3", "A4"]
    expect(board.valid_coordinate?.count).to eq(3)
    expect(board.valid_placement?(submarine,["A2", "A3", "A4"])).to eq(false)
  end
end
