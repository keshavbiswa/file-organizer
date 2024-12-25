# frozen_string_literal: true

require_relative 'file_handler'
require_relative 'file_order'

module FileOrganizer
  # organizer.rb
  class Organizer
    attr_reader :directory, :types, :new_folder, :new_path

    def initialize(directory)
      @directory = directory
      @file_handler = FileHandler.new(directory)
    end

    def organize
      @file_handler.scan_files.each do |file|
        categorize_file = FileOrganizer::FileOrder.new(file).categorize

        @file_handler.move_file(file, categorize_file)
      end
    end
  end
end
