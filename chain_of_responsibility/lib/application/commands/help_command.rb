# frozen_string_literal: true

class HelpCommand
  def run!(_simulation)
    File.read(File.join(File.dirname(__FILE__), '../../infrastructure/help.txt'))
  end
end
