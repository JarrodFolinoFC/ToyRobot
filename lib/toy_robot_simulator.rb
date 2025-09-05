# frozen_string_literal: true

require_relative './application/command_invoker'

class ToyRobotSimulator
  def initialize(input_source:, output_source:, simulation:, command_factory:)
    @input_source = input_source
    @output_source = output_source
    @simulation = simulation
    @command_factory = command_factory
  end

  def run!
    @input_source.build.each do |line|
      command = @command_factory.build(line.strip)
      message = CommandInvoker.new(command: command).run!(@simulation)
      @output_source.write(message) if message
    end
  end
end
