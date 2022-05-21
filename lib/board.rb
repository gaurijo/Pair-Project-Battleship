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

  def validates_length(ship, coordinates)
    ship.length == coordinates.length
  end

  def valid_placement?(ship, coordinates)
    @cells.keys.include?(coordinates)
    ship.length == coordinates.length
  ###
  #use .slice(4) to get an array of each coordinate
  #ex "A1","A2","A3","A4"
    @cells.keys.each_slice(4).to_a
  #ARRAY ["A1","A2","A3","A4"], ["B1","B2"...ETC]
    @cells.keys.each_slice(4).to_a.first
    #Use .first to get an array of JUST the "A"s
    #["A1","A2","A3","A4"]
    @cells.keys.each_slice(4).to_a[1]
    #["B1","B2", "B3", "B4"]
    @cells.keys.each_slice(4).to_a[2]
    #["C1",C2","C3", "C4"]
    @cells.keys.each_slice(4).to_a[3]
    #["D1","D2", "D3", "D4"]
    @cells.keys.each_slice(4).to_a.first[0]
    #Get first index of the first array = > "A1"
    @cells.keys.each_slice(4).to_a[1][0] # => "B1"
    @cells.keys.each_slice(4).to_a[2][0] # => "C1"
    @cells.keys.each_slice(4).to_a[3][0] # => "D1"

    first_col = [@cells.keys.each_slice(4).to_a.first[0],
    @cells.keys.each_slice(4).to_a[1][0],
    @cells.keys.each_slice(4).to_a[2][0],
    @cells.keys.each_slice(4).to_a[3][0]]

    #["A1", "B1", "C1","D1"]

    if ship.name == "Submarine"
      first_col.each_cons(2).to_a
      first_col.each_cons(2).to_a.any?(coordinates)


    # elsif ship.name == "Submarine"
      @cells.each_cons(2).to_a
      @cells.each_cons(2).to_a.any?(coordinates)
      # @cells.each_cons(2).to_a
      # @cells.each_cons(2).to_a.any?(coordinates)
    # else
    #   false

    elsif ship.name == "Cruiser"
      @cells.each_cons(3).to_a
      @cells.each_cons(3).to_a.any?(coordinates)

    # elsif ship.name == "Submarine"
      first_col.each_cons(3).to_a
      first_col.each_cons(3).to_a.any?(coordinates)

      # @cells.each_cons(3).to_a
      # @cells.each_cons(3).to_a.any?(coordinates)
    end
  end
end
  #Use .each_cons(2) to get the As array into
  #consecutive pairs in groups of 2.
  #[["A1,A2"], ["A2, A3"], ["A3, A4"]]
  #Use .any?([coordinates]) to see if ANY of the
  #consecutive pair groups are equal to the coordinates
  #passed in
