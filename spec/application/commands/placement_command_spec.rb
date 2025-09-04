# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../lib/application/commands/placement_command'
require_relative '../../../lib/models/simulation'
require_relative '../../../lib/models/grid'

RSpec.describe PlacementCommand do
  let(:direction) { 'NORTH' }
  let(:x_coord) { 2 }
  let(:y_coord) { 3 }
  let(:simulation) { Simulation.new(grid: Grid.new) }
  let(:command) { described_class.new(direction, x_coord, y_coord) }

  describe '#run!' do
    before { command.run!(simulation) }

    it 'sets the direction' do
      expect(simulation.direction).to eq(direction)
    end

    it 'sets the coordinates' do
      expect([simulation.x_coord, simulation.y_coord]).to eq([x_coord, y_coord])
    end
  end
end
