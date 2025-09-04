# frozen_string_literal: true

class PlacementCommand
  attr_accessor :x_coord, :y_coord, :direction

  def initialize(direction, x_coord, y_coord)
    @direction = direction
    @x_coord = x_coord
    @y_coord = y_coord
  end

  def run!(simulation)
    simulation.x_coord = x_coord
    simulation.y_coord = y_coord
    simulation.direction = direction
  end
end
