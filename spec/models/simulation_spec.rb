# frozen_string_literal: true

require 'spec_helper'

require_relative '../../lib/models/simulation'
require_relative '../../lib/models/grid'

RSpec.describe Simulation do
  subject(:simulation) { described_class.new(grid: grid, x_coord: x, y_coord: y, direction: direction) }

  let(:grid) { Grid.new }

  describe '#initialize' do
    let(:sim) { described_class.new(grid: Grid.new) }

    it { expect(sim).to be_a(described_class) }
  end

  describe 'validations' do
    context 'with valid direction' do
      let(:x) { 0 }
      let(:y) { 0 }
      let(:direction) { 'NORTH' }

      it 'is valid' do
        expect(simulation).to be_valid
      end
    end

    context 'with invalid direction' do
      let(:x) { 0 }
      let(:y) { 0 }
      let(:direction) { 'NORTH_WEST' }

      it 'is not valid' do
        expect(simulation).not_to be_valid
      end

      it 'adds an error for direction' do
        simulation.valid?
        expect(simulation.errors[:direction]).to include('is not included in the list')
      end
    end

    context 'without a grid' do
      let(:x) { 0 }
      let(:y) { 0 }
      let(:direction) { 'NORTH' }
      let(:grid) { nil }

      it 'is not valid' do
        expect(simulation).not_to be_valid
      end

      it 'adds an error for grid' do
        simulation.valid?
        expect(simulation.errors[:grid]).to include("can't be blank")
      end
    end

    context 'with out-of-bounds x_coord' do
      let(:x) { 5 }
      let(:y) { 0 }
      let(:direction) { 'NORTH' }

      it 'is not valid' do
        expect(simulation).not_to be_valid
      end

      it 'adds an error for x_coord' do
        simulation.valid?
        expect(simulation.errors[:x_coord]).not_to be_empty
      end
    end

    context 'with out-of-bounds y_coord' do
      let(:x) { 0 }
      let(:y) { 5 }
      let(:direction) { 'NORTH' }

      it 'is not valid' do
        expect(simulation).not_to be_valid
      end

      it 'adds an error for y_coord' do
        simulation.valid?
        expect(simulation.errors[:y_coord]).not_to be_empty
      end
    end

    context 'with valid coordinates' do
      let(:x) { 2 }
      let(:y) { 3 }
      let(:direction) { 'NORTH' }

      it 'is valid' do
        expect(simulation).to be_valid
      end
    end
  end
end
