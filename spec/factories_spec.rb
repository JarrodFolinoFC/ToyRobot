# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/models/grid'
require_relative '../lib/models/simulation'

RSpec.describe 'Factories' do
  describe 'grid factory' do
    it 'creates a valid grid' do
      grid = build(:grid)
      expect(grid).to be_valid
      expect(grid.height).to eq(5)
      expect(grid.width).to eq(5)
    end

    it 'creates a small grid with trait' do
      grid = build(:grid, :small)
      expect(grid).to be_valid
      expect(grid.height).to eq(3)
      expect(grid.width).to eq(3)
    end
  end

  describe 'simulation factory' do
    it 'creates a valid simulation' do
      simulation = build(:simulation)
      expect(simulation).to be_valid
      expect(simulation.x_coord).to eq(0)
      expect(simulation.y_coord).to eq(0)
      expect(simulation.direction).to eq('NORTH')
      expect(simulation.grid).to be_a(Grid)
    end

    it 'creates an unplaced simulation with trait' do
      simulation = build(:simulation, :unplaced)
      expect(simulation.x_coord).to be_nil
      expect(simulation.y_coord).to be_nil
      expect(simulation.direction).to be_nil
    end

    it 'creates a simulation at center with trait' do
      simulation = build(:simulation, :placed_center)
      expect(simulation.x_coord).to eq(2)
      expect(simulation.y_coord).to eq(2)
    end
  end
end
