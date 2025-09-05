# frozen_string_literal: true

require 'spec_helper'
require 'application/command_factory'

class TestCommand
end

class TestCommandWithArgs
  attr_reader :abc, :bcd, :cde

  def initialize(abc, bcd, cde)
    @abc = abc
    @bcd = bcd
    @cde = cde
  end
end

RSpec.describe CommandFactory do
  subject(:factory) do
    described_class.new(
      [{
        pattern: /^TESTCOMMAND$/,
        command_class: TestCommand
      }, {
        pattern: /TESTCOMMANDWITHARGS\s(\d+),(\d+),(\w+)/,
        command_class: TestCommandWithArgs
      }]
    )
  end

  describe '#build' do
    context 'with a simple command' do
      let(:command) { factory.build('TESTCOMMAND') }

      it { expect(command).to be_a(TestCommand) }
    end

    context 'with a command that requires arguments' do
      let(:command) { factory.build('TESTCOMMANDWITHARGS 1,2,ABC') }

      it do
        expect(command).to be_a(TestCommandWithArgs)
      end

      it do
        expect(command.abc).to eq('1')
      end

      it do
        expect(command.bcd).to eq('2')
      end

      it do
        expect(command.cde).to eq('ABC')
      end
    end
  end
end
