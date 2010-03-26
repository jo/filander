module Filander
  module Inside
    include Base

    def inside(source, destination = source, &block)
      create_directory destination
      FileUtils.cd(join_source(source)) { yield }
    end
  end
end
