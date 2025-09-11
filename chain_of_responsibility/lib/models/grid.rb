# frozen_string_literal: true

require 'active_model'

class Grid
  include ::ActiveModel::Validations
  validates :height, presence: true
  validates :width, presence: true
  attr_reader :height, :width

  def initialize(height: 5, width: 5)
    @height = height
    @width = width
  end

  def to_s
    "Grid(height: #{@height}, width: #{@width})"
  end
end
