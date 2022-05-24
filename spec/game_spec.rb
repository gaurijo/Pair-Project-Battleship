require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  before :each do
    @game = Game.new
    @board = Board.new
    @computer_board = Board.new
    @player_board = Board.new
  end

  it "exists" do
    expect(@game).to be_a(Game)
  end

  it "can contain a computer board" do
    expect(@computer_board).to be_a(Board)
  end

  it "can contain a player board" do
    expect(@player_board).to be_a(Board)
  end

   it "can contain a player ship" do
    ship = Ship.new("Cruiser", 3)
    expect(@cruiser_player).to be_a(Ship)
    expect(@submarine_player).to be_a(Ship)
  end

  xit "can contain a computer ship" do
    expect(@cruiser_computer).to be_a(Ship)
    expect(@submarine_computer).to be_a(Ship)
  end

  xit "can take a turn" do
  end

  xit "can keep track of hits, misses, and sinks and display them" do
  end

  xit "can determine a winner" do

  end

end
