module Filander
  module EmptyDirectory
    include Base

    def empty_directory(destination)
      create_directory destination
    end
  end
end
