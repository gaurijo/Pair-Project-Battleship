require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  it "exists" do
    board = Board.new
    expect(board).to be_a(Board)
  end
  it "contains a hash" do
    board = Board.new
    cell_hash = {
      "A1" => @cell,
      "A2" => @cell,
      "A3" => @cell,
      "A4" => @cell
      }
    expect(board.cells).to eq(cell_hash)
  end
end
