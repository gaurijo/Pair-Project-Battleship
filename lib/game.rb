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
      "Lessssgooooo!"
    elsif input == "q"
      puts "Boo, quitter!"
    else
      puts "Okay, bye."

    end
  end
end

game = Game.new
puts game.start_game
