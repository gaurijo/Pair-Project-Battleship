

class Board
  attr_reader :cell, :ship

  def initialize
  @cell = cell
  @ship = ship
  end

  def cells
  cell_hash = {
    "A1" => @cell,
    "A2" => @cell,
    "A3" => @cell,
    "A4" => @cell
    }
  end
end
