# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/models/grid'

RSpec.describe Grid do
  describe '#initialize' do
    let(:grid) { described_class.new }

    it { expect(grid).to be_a(described_class) }
    it { expect(grid.height).to eq(5) }
    it { expect(grid.width).to eq(5) }
  end

  describe 'validations' do
    it 'is valid with all required parameters' do
      grid = described_class.new(height: 4, width: 4)
      expect(grid).to be_valid
    end

    it 'is not valid without height' do
      grid = described_class.new(height: nil, width: 4)
      expect(grid).not_to be_valid
    end

    it 'is not valid without width' do
      grid = described_class.new(height: 4, width: nil)
      expect(grid).not_to be_valid
    end
  end
end
