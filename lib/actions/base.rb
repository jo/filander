module Filander
  module Base
    def join_source(destination = nil)
      return Filander.source_root if destination.nil?
      File.join Filander.source_root, destination
    rescue
      raise 'Please specify source_root!'
    end

    def join_destination(destination = nil)
      return Filander.destination_root if destination.nil?
      File.join Filander.destination_root, destination
    rescue
      raise 'Please specify destination_root!'
    end

    def create_directory(destination = nil)
      dest_dir = join_destination(destination)

      FileUtils.mkdir_p dest_dir unless File.exists?(dest_dir)
    end

    def create_directory_for(destination = nil)
      dest_dir = File.dirname(join_destination(destination))

      FileUtils.mkdir_p dest_dir unless File.exists?(dest_dir)
    end
  end
end
