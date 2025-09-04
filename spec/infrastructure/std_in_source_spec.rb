# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/infrastructure/std_in_source'

RSpec.describe StdInSource do
  it 'reads lines from an IO object' do
    io = StringIO.new("foo\nbar\nbaz\n")
    source = described_class.new(io)
    lines = source.build.to_a
    expect(lines).to eq(%w[foo bar baz])
  end
end
