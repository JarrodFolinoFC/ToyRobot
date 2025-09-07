# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/models/grid'

RSpec.describe Grid, 'using FactoryBot' do
  describe '#initialize' do
    let(:grid) { build(:grid) }

    it { expect(grid).to be_a(described_class) }
    it { expect(grid.height).to eq(5) }
    it { expect(grid.width).to eq(5) }
  end

  describe 'validations' do
    it 'is valid with all required parameters' do
      grid = build(:grid, height: 4, width: 4)
      expect(grid).to be_valid
    end

    it 'is not valid without height' do
      grid = build(:grid, height: nil)
      expect(grid).not_to be_valid
    end

    it 'is not valid without width' do
      grid = build(:grid, width: nil)
      expect(grid).not_to be_valid
    end

    it 'can create different sized grids using traits' do
      small_grid = build(:grid, :small)
      large_grid = build(:grid, :large)

      expect(small_grid.height).to eq(3)
      expect(small_grid.width).to eq(3)
      expect(large_grid.height).to eq(10)
      expect(large_grid.width).to eq(10)
    end
  end
end
