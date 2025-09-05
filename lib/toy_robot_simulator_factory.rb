# frozen_string_literal: true

require_relative './application/command_factory'
require_relative './application/commands/placement_command'
require_relative './application/commands/left_command'
require_relative './application/commands/right_command'
require_relative './application/commands/report_command'
require_relative './application/commands/move_command'
require_relative './application/commands/help_command'
require_relative './models/simulation'
require_relative './models/grid'

class ToyRobotSimulatorFactory
  # rubocop:disable Metrics/MethodLength
  def self.build_default_instance(input_source)
    simulation = Simulation.new(grid: Grid.new)
    commands = [
      {
        pattern: /^PLACE\s(\d+),(\d+),(NORTH|SOUTH|EAST|WEST)$/,
        command_class: PlacementCommand
      },
      {
        pattern: /^LEFT$/,
        command_class: LeftCommand
      },
      {
        pattern: /^RIGHT$/,
        command_class: RightCommand
      },
      {
        pattern: /^REPORT$/,
        command_class: ReportCommand
      },
      {
        pattern: /^MOVE$/,
        command_class: MoveCommand
      },
      {
        pattern: /.*/,
        command_class: HelpCommand
      }
    ]
    command_factory = CommandFactory.new(commands)
    ToyRobotSimulator.new(input_source, simulation, command_factory)
  end
  # rubocop:enable Metrics/MethodLength
end
