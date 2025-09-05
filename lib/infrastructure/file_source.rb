# frozen_string_literal: true

class FileSource
  def initialize(file_path:)
    @file_path = file_path
  end

  def build
    File.readlines(@file_path, chomp: true).each
  end
end
