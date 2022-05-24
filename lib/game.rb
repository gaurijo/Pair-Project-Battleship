require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class Game

  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @cruiser_computer = Ship.new("Cruiser", 3)
    @submarine_computer = Ship.new("Submarine", 2)
    @cruiser_player = Ship.new("Cruiser", 3)
    @submarine_player = Ship.new("Submarine", 2)
  end

  def start_menu
   puts "=========================================="
   puts "         Welcome to BATTLESHIP"
   puts "   Enter 'p' to play. Press 'q' to quit."
   puts "=========================================="
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

  def random_computer_placement(ship)
    random_cells = @computer_board.cells.keys.sample(ship.length)
    until @computer_board.valid_placement?(ship, random_cells)
      random_cells = @computer_board.cells.keys.sample(ship.length)
    end
    random_cells
  end

  def start_game
    cells = random_computer_placement(@cruiser_computer)
    @computer_board.place(@cruiser_computer, cells)
    cells = random_computer_placement(@submarine_computer)
    @computer_board.place(@submarine_computer, cells)
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    @player_board.render(ship_on_cell = true)
    puts "Enter the squares for the Cruiser (3 spaces):"
    player_placement = gets.chomp.upcase
    player_placement.split(" ")
    @player_board.place(@cruiser_player, player_placement.split(" "))
    @player_board.render(ship_on_cell = true)
    puts "Enter the squares for the Submarine (2 spaces):"
    player_placement = gets.chomp.upcase
    player_placement.split(" ")
    @player_board.place(@submarine_player, player_placement.split(" "))
    puts "~~~~~PLAYER BOARD~~~~~"
    @player_board.render(ship_on_cell = true)
  end

  def player_turn
    puts "Enter the coordinate for your shot:"
    player_turn_input = gets.chomp.upcase
    if @computer_board.valid_coordinate?(player_turn_input)
      @computer_board.cells[player_turn_input].fire_upon
      puts "~~~~~COMPUTER BOARD~~~~~"
      @computer_board.render
      puts "~~~~~PLAYER BOARD~~~~~"
      @player_board.render(ship_on_cell = true)
    end
  end
end

    # A single turn consists of:
    # Displaying the boards
    # Player choosing a coordinate to fire on
    # Computer choosing a coordinate to fire on
    # Reporting the result of the Player’s shot
    # Reporting the result of the Computer’s shot

battleship = Game.new
battleship.start_menu
battleship.player_turn
