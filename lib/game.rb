require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class Game

  def initialize
    @board = Board.new
    @computer_board = Board.new
    @player_board = Board.new
    @cruiser_computer = Ship.new("Cruiser", 3)
    @submarine_computer = Ship.new("Submarine", 2)
    # @computer_player = Player.new(:computer)
  end

  def start_menu
   puts "=========================================="
   puts
   puts "         Welcome to BATTLESHIP"
   puts "   Enter 'p' to play. Press 'q' to quit."
    input = gets.chomp.downcase
    until input == 'p'|| input == 'q'
      puts "Please try again!"
      puts "If you wish to play Battleship, please enter 'p' to play or 'q' to quit."
      input = gets.chomp.downcase
    end
    if input == 'p'
    start_game
    else input == 'q'
    puts "Goodbye! We're sad to see you go :("
     exit!
    end
  end

  def start_game
    @board.render(ship_on_cell = false)
    @computer_board.place(@cruiser_computer, ["A1", "A2", "A3"]) #(.shuffle?)
    # @computer_board.place(@submarine_computer, [@cells.coordinates.valid_placement?])

  end

end

# battleship = Game.new
# battleship.start_menu
# battleship.start_game
