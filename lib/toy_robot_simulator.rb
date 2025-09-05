# frozen_string_literal: true

require_relative './application/command_invoker'

class ToyRobotSimulator
  def initialize(input_source, simulation, command_factory)
    @input_source = input_source
    @simulation = simulation
    @command_factory = command_factory
  end

  def run!
    @input_source.build.each do |line|
      command = @command_factory.build(line.strip)
      output = CommandInvoker.new(command).run!(@simulation)
      puts output if output
    end
  end
end
