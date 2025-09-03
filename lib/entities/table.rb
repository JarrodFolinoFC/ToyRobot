# frozen_string_literal: true

class Grid
  attr_reader :length, :width

  def initialize(length:, width:)
    @length = length
    @width = width
  end
end
