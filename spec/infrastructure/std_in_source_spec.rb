# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/infrastructure/std_in_source'

RSpec.describe StdInSource do
  subject(:source) { described_class.new(stdin: io) }

  let(:input_string) { "foo\nbar\nbaz\n" }
  let(:io) { StringIO.new(input_string) }

  describe '#build' do
    subject(:lines) { source.build.to_a }

    context 'when reading from a StringIO' do
      it 'returns each line as an element' do
        expect(lines).to eq(%w[foo bar baz])
      end
    end

    context 'when reading from an empty input' do
      let(:input_string) { '' }

      it 'returns an empty array' do
        expect(lines).to be_empty
      end
    end
  end
end
