module Filander
  module CopyFile
    include Base

    def copy_file(source, destination = source)
      create_directory_for destination
      FileUtils.cp_r join_source(source), join_destination(destination)
    end
  end
end
