# frozen_string_literal: true

require 'spec_helper'

require_relative '../../lib/models/simulation'
require_relative '../../lib/models/grid'

RSpec.describe Simulation, 'using FactoryBot' do
  describe '#initialize' do
    it 'creates a simulation instance' do
      sim = build(:simulation, :unplaced)
      expect(sim).to be_a(described_class)
    end
  end

  describe 'validations' do
    context 'with valid direction' do
      let(:simulation) { build(:simulation) }

      it 'is valid' do
        expect(simulation).to be_valid
      end
    end

    context 'with invalid direction' do
      let(:simulation) { build(:simulation, direction: 'NORTH_WEST') }

      it 'is not valid' do
        expect(simulation).not_to be_valid
      end

      it 'adds an error for direction' do
        simulation.valid?
        expect(simulation.errors[:direction]).to include('is not included in the list')
      end
    end

    context 'without a grid' do
      let(:simulation) { build(:simulation, grid: nil) }

      it 'is not valid' do
        expect(simulation).not_to be_valid
      end

      it 'adds an error for grid' do
        simulation.valid?
        expect(simulation.errors[:grid]).to include("can't be blank")
      end
    end

    context 'with out-of-bounds x_coord' do
      let(:simulation) { build(:simulation, x_coord: 5) }

      it 'is not valid' do
        expect(simulation).not_to be_valid
      end

      it 'adds an error for x_coord' do
        simulation.valid?
        expect(simulation.errors[:x_coord]).not_to be_empty
      end
    end

    context 'with out-of-bounds y_coord' do
      let(:simulation) { build(:simulation, y_coord: 5) }

      it 'is not valid' do
        expect(simulation).not_to be_valid
      end

      it 'adds an error for y_coord' do
        simulation.valid?
        expect(simulation.errors[:y_coord]).not_to be_empty
      end
    end

    context 'with valid coordinates' do
      let(:simulation) { build(:simulation, :placed_center) }

      it 'is valid' do
        expect(simulation).to be_valid
      end
    end
  end
end
