# frozen_string_literal: true

require 'spec_helper'
require 'application/commands/print_command'
require 'models/simulation'
require 'models/grid'

RSpec.describe PrintCommand do
  subject(:command) { described_class.new }

  let(:direction) { nil }
  let(:simulation) { Simulation.new(grid: Grid.new, x_coord: 0, y_coord: 1, direction: direction) }

  describe '#run!' do
    context 'when robot is placed without direction' do
      it 'renders an empty grid' do
        result = command.run!(simulation)
        expect(result).to eq((['[ ]' * simulation.grid.width] * simulation.grid.height).join("\n"))
      end
    end

    context 'when robot is placed with a direction' do
      let(:direction) { 'NORTH' }

      it 'renders the robot with direction symbol' do
        result = command.run!(simulation)
        expect(result).to eq("[ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ]\n ⬆️[ ][ ][ ][ ]\n[ ][ ][ ][ ][ ]")
      end
    end
  end
end
