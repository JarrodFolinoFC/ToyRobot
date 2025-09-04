# frozen_string_literal: true

require 'spec_helper'
require 'application/command_invoker'
require 'application/commands/placement_command'
require 'models/simulation'
require 'models/grid'

RSpec.describe CommandInvoker do
  let(:simulation) { Simulation.new(grid: Grid.new) }

  describe '#run!' do
    before do
      invoker = described_class.new(PlacementCommand.new(1, 2, 'NORTH'))
      invoker.run!(simulation)
    end

    it { expect(simulation.x_coord).to eq(1) }
    it { expect(simulation.y_coord).to eq(2) }
    it { expect(simulation.direction).to eq('NORTH') }
  end

  describe '#run! with invalid command' do
    before do
      invoker = described_class.new(PlacementCommand.new(1, 2, 'INVALID'))
      invoker.run!(simulation)
    end

    it { expect(simulation.x_coord).to be_nil }
    it  { expect(simulation.y_coord).to be_nil }
    it  { expect(simulation.direction).to be_nil }
  end
end
