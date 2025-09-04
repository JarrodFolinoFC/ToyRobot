# frozen_string_literal: true

class PlacementCommand
  attr_accessor :x_coord, :y_coord, :direction

  def initialize(x_coord, y_coord, direction)
    @x_coord = x_coord.to_i
    @y_coord = y_coord.to_i
    @direction = direction
  end

  def run!(simulation)
    simulation.x_coord = x_coord
    simulation.y_coord = y_coord
    simulation.direction = direction
  end
end
