# frozen_string_literal: true

class InMemoryWriter
  def initialize
    @messages = []
  end

  def write(message)
    @messages << message
  end

  attr_reader :messages
end
