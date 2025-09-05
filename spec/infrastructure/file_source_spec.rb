# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/infrastructure/file_source'

RSpec.describe FileSource do
  subject(:source) { described_class.new(fixture_path) }

  let(:fixture_path) { "#{__dir__}/../fixtures/simple.txt" }

  describe '#build' do
    subject(:lines) { source.build.to_a }

    context 'when reading from a valid file' do
      it 'returns the expected commands' do
        expect(lines).to eq(['PLACE 0,0,NORTH', 'MOVE', 'LEFT', 'RIGHT', 'REPORT'])
      end
    end
  end
end
