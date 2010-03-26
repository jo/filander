module Filander
  module EmptyDirectory
    include Base

    def empty_directory(destination)
      dest_dir = join_destination(destination)

      if File.exists?(dest_dir)
        report :exist, destination
      else
        report :create, destination
        FileUtils.mkdir_p dest_dir
      end
    end
  end
end
