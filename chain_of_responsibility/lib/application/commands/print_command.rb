# frozen_string_literal: true

class PrintCommand
  DIRECTION_SYMBOLS = {
    'NORTH' => ' ⬆️',
    'SOUTH' => ' ⬇️',
    'EAST' => ' ➡️',
    'WEST' => ' ⬅️'
  }.freeze

  EMPTY_CELL = '[ ]'

  def run!(simulation)
    rows = []

    (0..simulation.grid.height - 1).to_a.reverse.each do |row|
      rows << build_row(row, simulation)
    end

    rows.join("\n")
  end

  private

  def build_row(row, simulation)
    row_cells = []

    (0..simulation.grid.width - 1).to_a.each do |column|
      row_cells << cell_content(row, column, simulation)
    end

    row_cells.join
  end

  def cell_content(row, column, simulation)
    robot_at_position = row == simulation.y_coord && column == simulation.x_coord
    if robot_at_position
      return EMPTY_CELL if simulation.direction.nil?

      DIRECTION_SYMBOLS[simulation.direction]
    else
      EMPTY_CELL
    end
  end
end
