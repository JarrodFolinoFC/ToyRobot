# frozen_string_literal: true

require 'spec_helper'
require 'application/commands/right_command'
require 'models/simulation'
require 'models/grid'

RSpec.describe RightCommand do
  describe '#run!' do
    [
      { initial_direction: 'NORTH', expected_direction: 'EAST' },
      { initial_direction: 'WEST', expected_direction: 'NORTH' },
      { initial_direction: 'SOUTH', expected_direction: 'WEST' },
      { initial_direction: 'EAST', expected_direction: 'SOUTH' }
    ].each do |test_case|
      it "rotates #{test_case[:initial_direction]} to #{test_case[:expected_direction]}" do
        simulation = Simulation.new(grid: Grid.new, direction: test_case[:initial_direction])
        described_class.new.run!(simulation)
        expect(simulation.direction).to eq(test_case[:expected_direction])
      end
    end
  end
end
