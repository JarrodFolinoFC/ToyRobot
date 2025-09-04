# frozen_string_literal: true

require_relative './commands/placement_command'

class CommandFactory
  def initialize
    @command_mappings = [
      {
        pattern: /PLACE\s(\d+),(\d+),(NORTH|SOUTH|EAST|WEST)/,
        command_class: PlacementCommand
      }
    ]
  end

  def build(input)
    @command_mappings.each do |mapping|
      if (match_data = input.match(mapping[:pattern]))
        return mapping[:command_class].new(*match_data[1..])
      end
    end
  end
end
