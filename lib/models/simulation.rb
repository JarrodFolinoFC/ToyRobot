# frozen_string_literal: true

require 'active_model'

class Simulation
  include ::ActiveModel::Validations

  attr_accessor :grid, :x_coord, :y_coord, :direction

  validates :direction,
            inclusion: { in: %w[NORTH SOUTH EAST WEST], allow_nil: true }
  validates :grid, presence: true
  validates :x_coord, numericality: {
    greater_than_or_equal_to: 0,
    less_than: ->(simulation) { simulation&.grid&.width || Float::INFINITY },
    allow_nil: true
  }
  validates :y_coord, numericality: {
    greater_than_or_equal_to: 0,
    less_than: ->(simulation) { simulation&.grid&.width || Float::INFINITY },
    allow_nil: true
  }

  def initialize(grid:, x_coord: nil, y_coord: nil, direction: nil)
    @grid = grid
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
  end

  def to_s
    "Simulation(grid: #{grid}, x_coord: #{x_coord}, y_coord: #{y_coord}, direction: #{direction})"
  end
end
