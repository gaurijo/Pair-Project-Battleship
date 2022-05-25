require './lib/board'
require './lib/cell'
require './lib/ship'

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
    elsif input == 'q'
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
    puts @player_board.render(ship_on_cell = true)
    puts "Enter the squares for the Cruiser (3 spaces):"
    player_turn = false
    until player_turn == true
      player_placement = gets.chomp.upcase.split(" ")
      if @player_board.valid_placement?(@cruiser_player, player_placement) == false
        puts "Those are invalid coordinates. Please try again:"
    redo
      else @player_board.place(@cruiser_player, player_placement)
      player_turn = true
      end
    end
    puts @player_board.render(ship_on_cell = true)
    puts "Enter the squares for the Submarine (2 spaces):"
    player_turn = false
    until player_turn == true
    player_placement = gets.chomp.upcase.split(" ")
      if @player_board.valid_placement?(@submarine_player, player_placement) == false
      puts "Those are invalid coordinates. Please try again:"
    redo
      else @player_board.place(@submarine_player, player_placement)
      player_turn = true
      @player_board.place(@cruiser_player, player_placement)
      end
    end
  end

  def player_turn
    puts "Enter the coordinate for your shot:"
    player_turn_input = gets.chomp.upcase
    until @computer_board.valid_coordinate?(player_turn_input)
      puts "Please enter a valid coordinate:"
      player_turn_input = gets.chomp.upcase
    end
    until !@computer_board.cells[player_turn_input].fired_upon?
      puts "You've already fired on this coordinate. Please enter new coordinates to fire upon."
      player_turn_input = gets.chomp.upcase
    end
    @computer_board.cells[player_turn_input].fire_upon
    puts "~~~~~COMPUTER BOARD~~~~~"
    puts "Your shot on #{@computer_board.cells[player_turn_input].coordinate} was a #{results_of_shot(@computer_board, player_turn_input)}."
    puts @computer_board.render
    puts "~~~~~PLAYER BOARD~~~~~"
    puts @player_board.render(ship_on_cell = true)
  end

  def results_of_shot(board, turn_input)
    word = ""
    if board.cells[turn_input].render == "M"
      word = "miss"
    elsif board.cells[turn_input].render == "H"
      word = "hit"
    elsif board.cells[turn_input].render == "X"
      word = "sunk"
    end
    word
  end

  def computer_turn
    fired_on_cell = @computer_board.cells.keys.sample(1)
    until !@player_board.cells[fired_on_cell[0]].fired_upon?
      fired_on_cell = @computer_board.cells.keys.sample(1)
    end
    @player_board.cells[fired_on_cell[0]].fire_upon
    puts "~~~~~COMPUTER BOARD~~~~~"
    puts @computer_board.render
    puts "~~~~~PLAYER BOARD~~~~~"
    puts "My shot on #{@player_board.cells[fired_on_cell[0]].coordinate} was a #{results_of_shot(@player_board, fired_on_cell[0])}."
    puts @player_board.render(ship_on_cell = true)
  end

  def mega_turn
    until end_game
      player_turn
      computer_turn
    end
    start_menu
  end

  def end_game
   if @cruiser_computer.sunk? && @submarine_computer.sunk?
     @computer_board.render(ship_on_cell = true)
     puts "**********You win**********!"
     true
   elsif @cruiser_player.sunk? && @submarine_player.sunk?
     @player_board.render(ship_on_cell = true)
     puts "***********I win***********!"
     true
   end
  end
end

battleship = Game.new
battleship.start_menu
battleship.mega_turn
