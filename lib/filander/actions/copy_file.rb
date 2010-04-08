module Filander
  module CopyFile
    include Base

    def copy_file(source, destination = source)
      create_directory_for destination
      filename = join_source(source)
      raise "Source file `#{filename}' does not exist" if !File.exists?(filename) && Filander.behavior != :pretend

      content = File.read(filename) rescue nil
      with_report destination, content do
        FileUtils.cp filename, join_destination(destination)
      end
    end
  end
end
