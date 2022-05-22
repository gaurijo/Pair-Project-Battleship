require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'


class Game
  def initialize
  end

  def start_game
    puts "Welcome to BATTLESHIP"
    puts
    puts "*^*^*^*^*^*^*^*^*^*^*^*^*^"
    puts
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp

    if input == "p"
      puts "Lessssgooooo!"
    elsif input == "q"
      puts "Boo, quitter!"
    else
      puts "Okay, bye."

    end
  end
  def user_setup
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
  end

  def computer_setup
    cell = Cell.new
    puts cell.place_ship
##I want it to place a ship on coordinates, but randomly. how?

  end
end

game = Game.new
puts game.start_game

puts game.user_setup
board = Board.new
puts board.render

puts "Enter the squares for the Cruiser (3 spaces): "
square = gets.chomp
