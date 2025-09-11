# frozen_string_literal: true

require 'spec_helper'
require 'application/commands/move_command'
require 'models/simulation'
require 'models/grid'

RSpec.describe MoveCommand do
  let(:simulation) { Simulation.new(grid: Grid.new, x_coord: 2, y_coord: 2, direction: direction) }
  let(:command) { described_class.new }

  describe '#run!' do
    before { command.run!(simulation) }

    context 'when facing NORTH' do
      let(:direction) { 'NORTH' }

      it {
        expect(simulation.y_coord).to eq(3)
      }

      it {
        expect(simulation.x_coord).to eq(2)
      }
    end

    context 'when facing SOUTH' do
      let(:direction) { 'SOUTH' }

      it {
        expect(simulation.y_coord).to eq(1)
      }

      it {
        expect(simulation.x_coord).to eq(2)
      }
    end

    context 'when facing EAST' do
      let(:direction) { 'EAST' }

      it {
        expect(simulation.y_coord).to eq(2)
      }

      it {
        expect(simulation.x_coord).to eq(3)
      }
    end

    context 'when facing WEST' do
      let(:direction) { 'WEST' }

      it {
        expect(simulation.y_coord).to eq(2)
      }

      it {
        expect(simulation.x_coord).to eq(1)
      }
    end
  end
end
