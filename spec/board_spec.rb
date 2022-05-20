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
    expect(board.valid_coordinate?("A1")).to eq true
    expect(board.valid_coordinate?("D4")).to eq true
    expect(board.valid_coordinate?("A5")).to eq false
    expect(board.valid_coordinate?("E1")).to eq false
    expect(board.valid_coordinate?("A22")).to eq false
  end

  it "can tell if the number of coordinates is equal to the length of ship" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq false
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq false
    expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq true
  end

  xit "can make sure the coordinates are in consecutive order" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end

  xit "can make sure coordinates are not diagonal" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end

  xit "can tell if the placement of the ship is valid" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end
end
