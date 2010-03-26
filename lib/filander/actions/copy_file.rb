module Filander
  module CopyFile
    include Base

    def copy_file(source, destination = source)
      create_directory_for destination
      filename = join_source(source)
      content = File.read(filename) rescue nil

      with_report destination, content do
        FileUtils.cp_r filename, join_destination(destination)
      end
    end
  end
end
