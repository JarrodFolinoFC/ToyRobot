# frozen_string_literal: true

class Grid
  attr_reader :length, :width

  def initialize(length: 5, width: 5)
    @length = length
    @width = width
  end
end
