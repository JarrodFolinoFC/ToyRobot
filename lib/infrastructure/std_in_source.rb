# frozen_string_literal: true

class StdInSource
  def initialize(stdin:)
    @stdin = stdin
  end

  def build
    @stdin.each_line(chomp: true)
  end
end
