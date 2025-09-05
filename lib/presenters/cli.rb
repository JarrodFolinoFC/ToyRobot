# frozen_string_literal: true

require_relative '../toy_robot_simulator_factory'
require_relative '../infrastructure/std_in_source'
require_relative '../infrastructure/std_out_writer'

class CLI
  def run!
    puts "
        _____   _________   _________________
       |     | |         | |                 |
       |T O Y| |R O B O T| |S I M U L A T O R|
       |_____| |_________| |_________________|

      Enter commands below:

    "
    ToyRobotSimulatorFactory.build_default_instance(
      input_source: StdInSource.new($stdin), output_writer: StdOutWriter.new
    ).run!
  end
end
