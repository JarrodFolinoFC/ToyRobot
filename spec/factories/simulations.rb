# frozen_string_literal: true

FactoryBot.define do
  factory :simulation do
    initialize_with { new(grid: grid, x_coord: x_coord, y_coord: y_coord, direction: direction) }

    grid { association :grid }
    x_coord { 0 }
    y_coord { 0 }
    direction { 'NORTH' }

    trait :unplaced do
      x_coord { nil }
      y_coord { nil }
      direction { nil }
    end

    trait :placed_center do
      x_coord { 2 }
      y_coord { 2 }
    end

    trait :facing_south do
      direction { 'SOUTH' }
    end

    trait :facing_east do
      direction { 'EAST' }
    end

    trait :facing_west do
      direction { 'WEST' }
    end

    trait :at_boundary do
      x_coord { 4 }
      y_coord { 4 }
    end
  end
end
