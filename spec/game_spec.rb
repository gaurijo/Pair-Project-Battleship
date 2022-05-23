require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
# require './lib/player'

RSpec.describe Game do
  before :each do
    @game = Game.new
    @board = Board.new
  end

  it "exists" do
    expect(@game).to be_a(Game)
  end

  it "can contain a board" do
    expect(@board).to be_a(Board)
  end
end
