# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'stringio'

def capture_stdout(&blk)
  old = $stdout
  $stdout = fake = StringIO.new
  blk.call
  fake.string.split("\n")
ensure
  $stdout = old
end
