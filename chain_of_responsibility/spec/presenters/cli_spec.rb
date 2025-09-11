# frozen_string_literal: true

require 'spec_helper'
require 'presenters/cli'

RSpec.describe CLI do
  let(:fixture_path) { "#{__dir__}/../fixtures/simple.txt" }
  let(:banner) do
    [
      '',
      '        _____   _________   _________________',
      '       |T O Y| |R O B O T| |S I M U L A T O R|',
      '       |_____| |_________| |_________________|',
      '    '
    ]
  end
  let(:empty_row) { '[ ][ ][ ][ ][ ]' }

  describe '#run! with the file path specified' do
    it 'processes the input and writes to stdout' do
      printed_lines = capture_stdout { described_class.new.run!([fixture_path]) }
      expect(printed_lines).to eq(
        banner + [empty_row, empty_row, empty_row, ' ⬆️[ ][ ][ ][ ]', empty_row]
      )
    end
  end
end
