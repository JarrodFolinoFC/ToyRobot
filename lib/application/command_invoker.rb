# frozen_string_literal: true

class CommandInvoker
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def run!(simulation)
    command.run!(simulation) if valid_command?(simulation)
  end

  private

  def valid_command?(simulation)
    dup = simulation.dup
    command.run!(dup)
    dup.valid?
  end
end
