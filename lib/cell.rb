

class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

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
    if fired_upon? == false
      if ship_on_cell == true && empty? == false
      "S"
      elsif ship_on_cell == true && empty? == true
      "."
      end
    elsif fired_upon? == true && empty? == true
      "M"
    elsif fired_upon? == true && empty? == false
      if @ship.health == 0
        "X"
      else
        "H"

      end
      end
    end
  end

  # class Cell
  #   attr_reader :coordinate, :ship
  #
  #   def initialize(coordinate)
  #     @coordinate = coordinate
  #     @ship = ship
  #   end
  #
  #   def empty?
  #     if @ship == nil
  #       true
  #     else
  #       false
  #     end
  #   end
  #
  #   def place_ship(ship)
  #     @ship = ship
  #   end
  # end
