require 'erb'

module Filander
  module Template
    include Base

    def template(source, destination = source)
      create_directory_for destination
      context = instance_eval('binding')
      content = ERB.new(File.read(join_source(source)), nil, '-').result(context)

      with_report destination, content do
        File.open(join_destination(destination), "w") { |file| file << content }
      end
    end
  end
end
