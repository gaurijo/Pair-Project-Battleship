require './lib/cell'
require 'pry'

class Board
  attr_reader :cells

  def initialize
    @cells = {
     "A1" => Cell.new("A1"),
     "A2" => Cell.new("A2"),
     "A3" => Cell.new("A3"),
     "A4" => Cell.new("A4"),
     "B1" => Cell.new("B1"),
     "B2" => Cell.new("B2"),
     "B3" => Cell.new("B3"),
     "B4" => Cell.new("B4"),
     "C1" => Cell.new("C1"),
     "C2" => Cell.new("C2"),
     "C3" => Cell.new("C3"),
     "C4" => Cell.new("C4"),
     "D1" => Cell.new("D1"),
     "D2" => Cell.new("D2"),
     "D3" => Cell.new("D3"),
     "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinates)
    @cells.keys.include?(coordinates)
  end

  def valid_placement?(ship, coordinates)
    if ship.length != coordinates.length
      return false
    end
    letters = coordinates.map do |coordinate|
      if @cells[coordinate].empty? == false
        return false
      end
      coordinate[0]
    end
    numbers = coordinates.map do |coordinate|
        coordinate[1]
    end
    if letters.uniq.count != 1 && numbers.uniq.count != 1
      return false
    end
    if letters.uniq.count == 1
      #verifies we're all on a's, b's, c's, d's
      return numbers.each_cons(2).all? { |x, y| y.to_i == x.to_i + 1 }
      #chekcing the #s, x = the 1st position, y = the 2nd pos)
    end
    if numbers.uniq.count == 1
      #verify we're all on 1's, 2's, 3's, 4's
      return letters.each_cons(2).all? { |x, y| y.ord == x.ord + 1 }
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.map do |coordinate|
        @cells[coordinate].ship = ship
      end
    end
  end

  def render(ship_on_cell = false)
    puts "  1 2 3 4 \nA #{@cells["A1"].render(ship_on_cell)} #{@cells["A2"].render(ship_on_cell)} #{@cells["A3"].render(ship_on_cell)} #{@cells["A4"].render(ship_on_cell)}"+
    "\nB #{@cells["B1"].render(ship_on_cell)} #{@cells["B2"].render(ship_on_cell)} #{@cells["B3"].render(ship_on_cell)} #{@cells["B4"].render(ship_on_cell)}"+
    "\nC #{@cells["C1"].render(ship_on_cell)} #{@cells["C2"].render(ship_on_cell)} #{@cells["C3"].render(ship_on_cell)} #{@cells["C4"].render(ship_on_cell)}"+
    "\nD #{@cells["D1"].render(ship_on_cell)} #{@cells["D2"].render(ship_on_cell)} #{@cells["D3"].render(ship_on_cell)} #{@cells["D4"].render(ship_on_cell)}"
  end
end




#
#   #Use .any?([coordinates]) to see if ANY of the
#   #consecutive pair groups are equal to the coordinates
#   #passed in
#   # def valid_placement?(ship, coordinates)
#   #   @cells.keys.include?(coordinates)
  #   ship.length == coordinates.length
  # ###
  # #use .slice(4) to get an array of each coordinate
  # #ex "A1","A2","A3","A4"
  #   @cells.keys.each_slice(4).to_a
  # #ARRAY ["A1","A2","A3","A4"], ["B1","B2"...ETC]
  #   @cells.keys.each_slice(4).to_a.first
    #Use .first to get an array of JUST the "A"s
    #["A1","A2","A3","A4"]
    # @cells.keys.each_slice(4).to_a[1]
    #["B1","B2", "B3", "B4"]
    # @cells.keys.each_slice(4).to_a[2]
    #["C1",C2","C3", "C4"]
    # @cells.keys.each_slice(4).to_a[3]
    #["D1","D2", "D3", "D4"]
    # @cells.keys.each_slice(4).to_a.first[0]
    #Get first index of the first array = > "A1"
    # @cells.keys.each_slice(4).to_a[1][0] # => "B1"
    # @cells.keys.each_slice(4).to_a[2][0] # => "C1"
    # @cells.keys.each_slice(4).to_a[3][0] # => "D1"

  #Use .each_cons(2) to get the As array into
  #consecutive pairs in groups of 2.
  #[["A1,A2"], ["A2, A3"], ["A3, A4"]]
  #Use .any?([coordinates]) to see if ANY of the
  #consecutive pair groups are equal to the coordinates
  #passed in
