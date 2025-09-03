# frozen_string_literal: true

require_relative '../../lib/entities/grid'

RSpec.describe Grid do
  describe '#initialize' do
    it 'initializes a 5x5 grid by default' do
      grid = Grid.new
      expect(grid).to be_a(Grid)
      expect(grid.length).to eq(5)
      expect(grid.width).to eq(5)
    end
  end
end
