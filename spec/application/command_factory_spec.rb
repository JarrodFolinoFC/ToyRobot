# frozen_string_literal: true

require 'spec_helper'
require 'application/command_factory'
require 'application/commands/placement_command'

RSpec.describe CommandFactory do
  subject(:factory) { described_class.new }

  describe '#build' do
    let(:command) { factory.build('PLACE 1,2,NORTH') }

    it { expect(command).to be_a(PlacementCommand) }
    it { expect(command.x_coord).to eq(1) }
    it { expect(command.y_coord).to eq(2) }
    it { expect(command.direction).to eq('NORTH') }
  end
end
