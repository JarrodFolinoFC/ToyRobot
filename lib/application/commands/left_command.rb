# frozen_string_literal: true

class LeftCommand
  DIRECTION_MAPPING = {
    'NORTH' => 'WEST',
    'WEST' => 'SOUTH',
    'SOUTH' => 'EAST',
    'EAST' => 'NORTH'
  }.freeze

  def run!(simulation)
    simulation.direction = DIRECTION_MAPPING[simulation.direction]
    nil
  end
end
