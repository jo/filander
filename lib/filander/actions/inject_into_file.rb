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

      position = config[:after] ? :after : :before
      flag     = config[position]
      flag     = Regexp.escape(flag) unless flag.is_a?(Regexp)

      replacement = if position == :after
                      '\0' + data
                    else
                      data + '\0'
                    end

      present = if position == :after
                  /#{flag}#{Regexp.escape data}/
                else
                  /#{Regexp.escape data}#{flag}/
                end

      content = File.read(filename) if File.file?(filename)
      content ||= ''
      content.gsub!(/#{flag}/, replacement) unless content =~ present

      with_report destination, content do
        File.open(filename, "w") { |file| file << content }
      end
    end
  end
end
