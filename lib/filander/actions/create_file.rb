module Filander
  module CreateFile
    include Base

    def create_file(destination, content)
      create_directory_for destination

      with_report destination, content do
        File.open(join_destination(destination), "w") { |file| file << content }
      end
    end
  end
end
