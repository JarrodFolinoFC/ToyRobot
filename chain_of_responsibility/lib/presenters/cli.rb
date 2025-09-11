# frozen_string_literal: true

require_relative '../toy_robot_simulator_factory'
require_relative '../infrastructure/std_in_source'
require_relative '../infrastructure/file_source'
require_relative '../infrastructure/std_out_writer'

class CLI
  def run!
    input_source = ARGV.size == 1 ? FileSource.new(file_path: ARGV[0]) : StdInSource.new(stdin: $stdin)
    puts "
        _____   _________   _________________
       |T O Y| |R O B O T| |S I M U L A T O R|
       |_____| |_________| |_________________|
    "
    puts 'Enter commands below' if input_source.instance_of?(StdInSource)

    ToyRobotSimulatorFactory.build_default_instance(
      input_source: input_source, output_writer: StdOutWriter.new
    ).run!
  end
end
