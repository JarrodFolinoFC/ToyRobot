# frozen_string_literal: true

require_relative './application/command_factory'
require_relative './application/command_invoker'
require_relative './infrastructure/stdin_source'
require_relative './models/simulation'
require_relative './models/grid'

class ToyRobotSimulator
  def initialize(input_source)
    @input_source = input_source
    @simulation = Simulation.new(grid: Grid.new)
    @command_factory = CommandFactory.new
  end

  def run!
    @input_source.build.each do |line|
      command = CommandFactory.new.build(line.strip)
      CommandInvoker.new(command).run!(@simulation)
      puts @simulation
    end
  end
end
