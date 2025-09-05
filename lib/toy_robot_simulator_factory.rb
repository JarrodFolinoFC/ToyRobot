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
require_relative './infrastructure/std_out_writer'
require_relative './toy_robot_simulator'

class ToyRobotSimulatorFactory
  # rubocop:disable Metrics/MethodLength
  def self.build_default_instance(input_source:, output_writer:)
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
    command_factory = CommandFactory.new(command_mappings: commands)
    ToyRobotSimulator.new(input_source: input_source, output_source: output_writer, simulation: simulation,
                          command_factory: command_factory)
  end
  # rubocop:enable Metrics/MethodLength
end
