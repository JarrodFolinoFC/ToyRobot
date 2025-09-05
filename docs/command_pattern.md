# Command Pattern Contract in ToyRobotSimulator

The ToyRobotSimulator project implements a clear contract for the Command pattern, particularly in how commands are created from user input and executed on the simulation.

## Command Object Contract

### Core Requirements:

1. Each command class must implement a `run!(simulation)` method that:

   - Takes a `Simulation` object as its only parameter
   - Performs the command's action on the simulation
   - Returns `nil` or output string (for commands like `ReportCommand` and `HelpCommand`)

2. Command constructors must match the capturing groups from their regex pattern:
   - Simple commands (like `LeftCommand`) need a no-argument constructor
   - Complex commands (like `PlacementCommand`) must accept arguments matching their regex capture groups

## Command Creation Flow

The flow from user input to command execution works as follows:

1. **Pattern Matching**:
   `CommandFactory` receives input strings and matches them against regex patterns:

   ```ruby
   def build(input)
     @command_mappings.each do |mapping|
       if (match_data = input.match(mapping[:pattern]))
         return mapping[:command_class].new(*match_data[1..])
       end
     end
   end
   ```

2. **Argument Extraction**:
   When a pattern matches, the regex capturing groups become constructor arguments:

   - `match_data[1..]` extracts all capture groups (skipping the full match at index 0)
   - `*` (splat) operator expands these groups as individual arguments

3. **Command Instantiation**:
   The command is created with extracted arguments:
   - `PlacementCommand.new('2', '3', 'NORTH')` for `PLACE 2,3,NORTH`
   - `LeftCommand.new()` for `LEFT`

## Example: The PlacementCommand

For the input `PLACEH 2,3,NORTH`:

1. Matches pattern: `/^PLACE\s(\d+),(\d+),(NORTH|SOUTH|EAST|WEST)$/`
2. Capture groups: `['2', '3', 'NORTH']`
3. Command creation: `PlacementCommand.new('2', '3', 'NORTH')`
4. The command must handle string-to-integer conversion internally

```ruby
class PlacementCommand
  def initialize(x_coord, y_coord, direction)
    @x_coord = x_coord.to_i
    @y_coord = y_coord.to_i
    @direction = direction
  end

  def run!(simulation)
    simulation.x_coord = x_coord
    simulation.y_coord = y_coord
    simulation.direction = direction
    nil
  end
end
```

## Command Validation

Validation occurs after command creation through `CommandInvoker` and are only executed if they result in a valid Simulation object

## Command Registry

Commands are registered in the `ToyRobotSimulator.build_default_instance` method:

This registry connects input patterns to their corresponding command classes.
