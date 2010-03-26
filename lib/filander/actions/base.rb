module Filander
  module Base
    def join_source(destination = nil)
      return Filander.source_root if destination.nil?
      File.join Filander.source_root, destination
    rescue
      raise 'Please specify source_root!'
    end

    def join_destination(destination = nil)
      return Filander.destination_root if destination.nil?
      File.join Filander.destination_root, destination
    rescue
      raise 'Please specify destination_root!'
    end

    def create_directory_for(destination = nil)
      dest_dir = File.dirname(join_destination(destination))

      FileUtils.mkdir_p dest_dir unless File.exists?(dest_dir)
    end

    def with_report(destination, content = nil)
      filename = join_destination(destination)

      if File.file?(filename)
        if content == File.read(filename)
          report :identical, destination
        else
          report :force, destination
        end
      else
        report :create, destination
      end

      yield
    end

    def report(verb, filename)
      return if Filander.quiet

      # TODO: make this nice
      name = Pathname.new(File.expand_path(join_destination(filename))).relative_path_from(Pathname.new(File.expand_path(Filander.destination_root_stack.first)))

      color = case verb
              when :create
                :green
              when :force, :skip
                :yellow
              when :conflict
                :red
              else
                :blue
              end

      verb = verb.to_s.rjust(12)
      verb = $terminal.color(verb, :bold, color) if defined? $terminal

      puts '%s  %s' % [verb, name]
    end
  end
end
