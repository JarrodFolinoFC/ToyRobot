# frozen_string_literal: true

require_relative '../toy_robot_simulator_factory'
require_relative '../infrastructure/std_in_source'

class CLI
  def run!
    puts "
        _____   _________   _________________
       |     | |         | |                 |
       |T O Y| |R O B O T| |S I M U L A T O R|
       |_____| |_________| |_________________|

       Since 2010

      Enter commands below:

    "
    ToyRobotSimulatorFactory.build_default_instance(StdInSource.new($stdin)).run!
  end
end
