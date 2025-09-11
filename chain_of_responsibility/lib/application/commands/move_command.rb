# frozen_string_literal: true

class MoveCommand
  def run!(simulation)
    return if simulation.direction.nil?

    move_in_direction(simulation)
    nil
  end

  private

  def move_in_direction(simulation)
    case simulation.direction
    when 'NORTH' then simulation.y_coord += 1
    when 'SOUTH' then simulation.y_coord -= 1
    when 'EAST'  then simulation.x_coord += 1
    when 'WEST'  then simulation.x_coord -= 1
    end
  end
end
