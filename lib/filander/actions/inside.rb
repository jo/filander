module Filander
  module Inside
    include Base

    def inside(source, destination = source, &block)
      dest_dir = join_destination(destination)
      dirname = join_source(source)

      FileUtils.mkdir_p dest_dir unless File.exists?(dest_dir)

      FileUtils.cd(dirname) do
        Filander.destination_root_stack.push(dest_dir)
        Filander.source_root_stack.push(dirname)
        yield
        Filander.source_root_stack.pop
        Filander.destination_root_stack.pop
      end
    end
  end
end
