

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
    @computer_board.place(@cruiser_computer, ["A1", "A2", "A3"])
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "~~~~~COMPUTER BOARD~~~~~"
    @computer_board.render(ship_on_cell = false)
    puts "Enter the squares for the Cruiser (3 spaces):"
    @player_board.place(@cruiser_player, ["B1", "B2", "B3"])
    puts "~~~~~PLAYER BOARD~~~~~"
    @player_board.render(ship_on_cell = true)
  end

  def computer_turn
      if @player_board.valid_coordinate?(@coordinates)
        @player_board.cells[@coordinates].fire_upon
      puts "~~~~~PLAYER BOARD~~~~~"
      return @player_board.render
      puts "~~~~~COMPUTER BOARD~~~~~"
      @computer_board.render(ship_on_cell = true)
      end
    end


  def player_turn
    puts "Enter the coordinate for your shot:"
    player_turn_input = gets.chomp.upcase
    if @computer_board.valid_coordinate?(player_turn_input)
      @computer_board.cells[player_turn_input].fire_upon
    puts "~~~~~COMPUTER BOARD~~~~~"
    return @computer_board.render
    puts "~~~~~PLAYER BOARD~~~~~"
    @player_board.render(ship_on_cell = true)
    end
  end

  def mega_turn
    # loop through game.player_turn and game.computer_turn
    until @cruiser_computer.sunk? && @submarine_computer.sunk? || @cruiser_player.sunk? &&
    @submarine_player.sunk? do

    end

    if @cruiser_computer.sunk? && @submarine_computer.sunk?
      puts "You win!"
    else
      puts "I win!"
    end
  end
        #check that computer's ship is sunk
    #check that player's ship is sunk
    #if either OR are true, break the loop of turns?



  end



    # A single turn consists of:
    # Displaying the boards - done
    # Player choosing a coordinate to fire on - done
    # Computer choosing a coordinate to fire on
    # Reporting the result of the Player’s shot
    # Reporting the result of the Computer’s shot




# battleship = Game.new
# battleship.start_menu
# battleship.player_turn
# battleship.computer_turn
# battleship.mega_turn
