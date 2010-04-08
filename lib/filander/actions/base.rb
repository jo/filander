module Filander
  module Base
    def join_source(filename = nil)
      join Filander.source_root, filename
    rescue
      raise 'Please specify source_root'
    end

    def join_destination(filename = nil)
      join Filander.destination_root, filename
    rescue
      raise 'Please specify destination_root'
    end

    def create_directory_for(destination = nil)
      dest_dir = File.dirname(join_destination(destination))

      FileUtils.mkdir_p dest_dir unless File.exists?(dest_dir)
    end

    def with_report(destination, content = nil)
      filename = join_destination(destination)

      skip = Filander.behavior == :skip
      if File.exists?(filename)
        if File.file?(filename) && content == File.read(filename)
          report :identical, destination
          skip = true
        elsif File.directory?(filename) && content == entries(filename)
          report :identical, destination
          skip = true
        else
          case Filander.behavior
          when :force
            report :force, destination
          when :skip
            report :skip, destination
          else
            file = $terminal.color(filename, :bold) if defined? $terminal
            skip = nil
            puts 'Overwrite %s [Nyc]?' % file
            until !skip.nil?
              answer = STDIN.gets.chomp.downcase
              case answer
              when '', 'n', 'no'
                skip = true
              when 'y', 'yes'
                skip = false
              when 'c', 'cancel'
                exit
              else
                puts 'Please anwer either [Y]es, [N]o or [C]ancel'
                skip = nil
              end
            end
            report skip ? :skip : :force, destination
          end
        end
      else
        report :create, destination
      end

      yield unless skip || Filander.behavior == :pretend
    end

    def report(verb, filename)
      return if Filander.quiet

      # TODO: make this nice
      if Filander.destination_root
        begin
          name = Pathname.new(File.expand_path(join_destination(filename))).relative_path_from(Pathname.new(File.expand_path(Filander.destination_root_stack.first)))
        rescue
          name = filename
        end
      else
        name = filename
      end

      color = case verb
              when :create
                :green
              when :force, :skip
                :yellow
              when :conflict
                :red
              when :execute
                :magenta
              when :install
                :cyan
              else
                :blue
              end

      verb = verb.to_s.rjust(12)
      verb = $terminal.color(verb, :bold, color) if defined? $terminal

      puts '%s  %s' % [verb, name]
    end

    def entries(dirname)
      basename = Pathname.new(dirname)
      array = Dir[File.join(dirname, '**')]
      array.map! { |f| Pathname.new f }
      array.map! { |p| p.relative_path_from basename }
      array
    end

    private

    def join(root, filename)
      return Filander.source_root if filename.nil?
      return filename if filename =~ /^\//
      return File.expand_path(filename) if filename =~ /^~/
      File.join root, filename
    end
  end
end
