# frozen_string_literal: true

require 'spec_helper'
require 'application/commands/placement_command'
require 'models/simulation'
require 'models/grid'

RSpec.describe PlacementCommand do
  let(:direction) { 'NORTH' }
  let(:x_coord) { '2' }
  let(:y_coord) { '3' }
  let(:simulation) { Simulation.new(grid: Grid.new) }
  let(:command) { described_class.new(x_coord, y_coord, direction) }

  describe '#run!' do
    before { command.run!(simulation) }

    it { expect(simulation.direction).to eq(direction) }
    it { expect(simulation.x_coord).to eq(x_coord.to_i) }
    it { expect(simulation.y_coord).to eq(y_coord.to_i) }
  end
end
