module Filander
  module InjectIntoFile
    # TODO: do this
    def inject_into_file(destination, *args, &block)
      if block_given?
        data, config = block, args.shift
      else
        data, config = args.shift, args.shift
      end
    end
  end
end
