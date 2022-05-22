class Cell
  attr_reader :coordinate,
              :fired_upon

  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship
      @ship.health -= 1
    end
  end

  def render(ship_on_cell = false)
    if ship_on_cell == true && fired_upon? == false
      "S"
    elsif fired_upon? == false && empty?
      "."
    elsif fired_upon? == true && empty?
      "M"
    elsif fired_upon? == true && !empty?
      if ship.health == 0
        "X"
      else
        "H"
      end
    end
  end
end
