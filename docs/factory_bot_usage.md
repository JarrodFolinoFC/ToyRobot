# FactoryBot Usage Guide

This project now includes FactoryBot for simplified test data creation. FactoryBot is a library for setting up Ruby objects as test data.

## Available Factories

### Grid Factory

```ruby
# Create a default 5x5 grid
grid = build(:grid)

# Create a custom sized grid
grid = build(:grid, height: 3, width: 4)

# Use predefined traits
small_grid = build(:grid, :small)    # 3x3 grid
large_grid = build(:grid, :large)    # 10x10 grid
```

### Simulation Factory

```ruby
# Create a basic simulation (placed at 0,0 facing NORTH)
simulation = build(:simulation)

# Create an unplaced simulation
simulation = build(:simulation, :unplaced)

# Create a simulation at the center of the grid
simulation = build(:simulation, :placed_center)  # at 2,2

# Create a simulation facing different directions
simulation = build(:simulation, :facing_south)
simulation = build(:simulation, :facing_east)
simulation = build(:simulation, :facing_west)

# Create a simulation at the boundary
simulation = build(:simulation, :at_boundary)  # at 4,4

# Combine traits and custom attributes
simulation = build(:simulation, :placed_center, :facing_south)
simulation = build(:simulation, x_coord: 1, y_coord: 3, direction: 'EAST')
```

## Benefits

1. **Reduced boilerplate**: Instead of `Simulation.new(grid: Grid.new, x_coord: 2, y_coord: 2, direction: 'NORTH')`, use `build(:simulation, :placed_center)`

2. **Consistent test data**: Factories ensure consistent object creation across tests

3. **Flexible traits**: Mix and match traits to create various scenarios easily

4. **Maintainability**: Changes to object construction patterns can be updated in one place

## Comparison

### Before FactoryBot
```ruby
let(:grid) { Grid.new }
let(:simulation) { Simulation.new(grid: grid, x_coord: 2, y_coord: 2, direction: 'NORTH') }
```

### After FactoryBot
```ruby
let(:simulation) { build(:simulation, :placed_center) }
```

## Examples

See `spec/models/simulation_with_factory_bot_spec.rb` and `spec/models/grid_with_factory_bot_spec.rb` for practical examples of using FactoryBot in tests.