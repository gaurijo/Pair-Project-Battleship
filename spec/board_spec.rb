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
end
