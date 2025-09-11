# frozen_string_literal: true

class RightCommand
  DIRECTION_MAPPING = {
    'WEST' => 'NORTH',
    'SOUTH' => 'WEST',
    'EAST' => 'SOUTH',
    'NORTH' => 'EAST'
  }.freeze

  def run!(simulation)
    simulation.direction = DIRECTION_MAPPING[simulation.direction]
    nil
  end
end
