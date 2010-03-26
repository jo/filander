module Filander
  module CreateFile
    include Base

    def create_file(destination, content)
      create_directory_for destination
      File.open(join_destination(destination), "w") { |file| file << content }
    end
  end
end
