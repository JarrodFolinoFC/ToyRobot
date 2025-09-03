# frozen_string_literal: true

class Simulation
  attr_reader :grid, :coords, :direction

  def initialize(grid:, coords: nil, direction: nil)
    @grid = grid
    @coords = coords
    @direction = direction
  end
end
