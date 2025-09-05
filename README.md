# ToyRobot

## Design Decisions

### Tooling

- Using Ruby 3.2.3 as that is the version supported by the default Github Actions container image
- Using Rubocop (github ruleset) and Simplecov
- Following the [Better Specs Best Practises](https://www.betterspecs.org/)
- Using ActiveModel standalone for validation (no need for ActiveRecord and we want to follow Clean Architecture by Robert C MArtin)

### Implementation

- Using [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) to seperate the concerns and structure the project
- For such a simple CLI interface no CLI gem is required
- The concepts of a robot and table are contained purely on the presentation layer. In the models they will be the Simulation and Grid
- Commands are only responsible for execution, they do validate if it is a valid command
- The Command Invoker is reponsible for verifying if the command result is valid,
  - try the command on a dup object
  - check if it is valid
  - if it is you run on the real object
- Created a contract for the commands [docs/command_pattern.md](docs/command_pattern.md)
- Not using any advance Ruby meta programming as we want to display good OO design using SOLID principles
- Command intepretation and command execution are seperate class

### Trade Offs

- No explict interfaces as this is against Ruby standard conventions


#### Command Contract
See [docs/command_pattern.md](docs/command_pattern.md) for details on the Command Pattern implementation and contract structure.


## Todos

- `require 'active_model'` change to only require validations
- add int test that reads from a file

