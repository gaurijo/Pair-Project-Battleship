require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'


class Game
  attr_reader :board, :cells, :cruiser, :submarine
  def initialize
    @board = Board.new
    @computer_board = Board.new
    @player_board = Board.new
    @cruiser_comp = Ship.new("Cruiser", 3)
    @submarine_comp = Ship.new("Submarine", 2)
    # @cells = cells
  end

  def start_game
    puts
    puts "Welcome to BATTLESHIP"
    puts
    puts "*^*^*^*^*^*^*^*^*^*^*^*^*^"
    puts
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp.downcase

    if input == "p"
      puts "TIME FOR BATTLE!"
    elsif input == "q"
      puts "Boo, quitter!"
    else
      puts "Okay, bye."
        exit!

    end
  end

  def user_setup

    puts "You now need to lay out your two ships."
    puts
    puts "The Cruiser is three units long and the Submarine is two units long."
  end
binding.pry
  def computer_setup

    @computer_board.place(@cruiser, ["A1", "A2", "A3"])
    @computer_board.place(@submarine, ["B1", "C1"])
    puts "I have laid out my ships on the grid."
  end

    #The computer player should place their ships.
    #The baseline computer should simply use random placements but still
    #adhere to the valid placement rules from iteration 2.

end

binding.pry
board = Board.new
game = Game.new
puts game.start_game

# puts game.computer_setup
 ##??



puts game.user_setup

puts board.render

puts "Enter the squares for the Cruiser (3 spaces): "
answer = gets.chomp
