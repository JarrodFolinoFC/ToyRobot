# frozen_string_literal: true

require_relative '../toy_robot_simulator'
require_relative '../infrastructure/stdin_source'

class CLI
  def run!
    puts "
        _____   _________   _________________
       |     | |         | |                 |
       |T O Y| |R O B O T| |S I M U L A T O R|
       |_____| |_________| |_________________|

      Made in Melbourne ❤️
      Since 2010

      Enter commands below:

    "
    ToyRobotSimulator.new(StdInSource.new($stdin)).run!
  end
end
