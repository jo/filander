module Filander
  module Cmd
    include Base

    def cmd(command)
      report :execute, command
      unless Filander.behavior == :pretend
        system command
      end
    end
  end
end
