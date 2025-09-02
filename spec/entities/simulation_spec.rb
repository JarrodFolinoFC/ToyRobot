# frozen_string_literal: true

require_relative '../../lib/entities/simulation'
require_relative '../../lib/entities/grid'

RSpec.describe Simulation do
  describe '#initialize' do
    it 'creates a Simulation with a grid' do
      sim = Simulation.new(grid: Grid.new)
      expect(sim).to be_a(Simulation)
    end
  end
end
