module Filander
  module CopyDirectory
    include Base

    def copy_directory(source, destination = source)
      create_directory_for destination
      filename = join_source(source)
      raise "Source file `#{filename}' does not exist" if !File.exists?(filename) && Filander.behavior != :pretend

      dest = join_destination(destination)
      with_report destination, entries(filename) do
        FileUtils.rm_rf dest
        FileUtils.cp_r filename, dest
      end
    end
  end
end
