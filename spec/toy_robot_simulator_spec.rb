# frozen_string_literal: true

require 'spec_helper'
require 'toy_robot_simulator_factory'
require 'toy_robot_simulator'
require 'infrastructure/file_source'
require 'infrastructure/in_memory_writer'

RSpec.describe ToyRobotSimulator do
  subject(:simulator) do
    ToyRobotSimulatorFactory.build_default_instance(
      input_source: input_source,
      output_writer: output_writer
    )
  end

  let(:input_source) { FileSource.new(file_path: "#{__dir__}/fixtures/simple.txt") }
  let(:output_writer) { InMemoryWriter.new }

  describe '#run!' do
    before { simulator.run! }

    it 'processes commands and outputs the final robot state' do
      expect(output_writer.messages).to include(
        'Simulation(grid: Grid(height: 5, width: 5), x_coord: 0, y_coord: 1, direction: NORTH)'
      )
    end
  end
end
