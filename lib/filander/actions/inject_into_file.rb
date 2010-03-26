module Filander
  module InjectIntoFile
    include Base

    def inject_into_file(destination, *args, &block)
      filename = join_destination(destination)

      if block_given?
        data, config = block.call, args.shift
      else
        data, config = args.shift, args.shift
      end

      data     = Regexp.escape(data) unless data.is_a?(Regexp)
      position = config[:after] ? :after : :before
      flag     = config[position]

      replacement = if position == :after
                      '\0' + data
                    else
                      data + '\0'
                    end

      content = File.read(filename)
      content.gsub!(/#{flag}/, replacement)

      File.open(filename, "w") { |file| file << content }
    end
  end
end
