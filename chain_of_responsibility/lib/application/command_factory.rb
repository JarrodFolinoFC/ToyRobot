# frozen_string_literal: true

require_relative './commands/placement_command'

class CommandFactory
  def initialize(command_mappings:)
    @command_mappings = command_mappings
  end

  def build(input)
    @command_mappings.each do |mapping|
      if (match_data = input.match(mapping[:pattern]))
        return mapping[:command_class].new(*match_data[1..])
      end
    end
  end
end
