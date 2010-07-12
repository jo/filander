module Filander
  module Cmd
    include Base

    def cmd(command, verb = :execute, name = command)
      report verb, name if verb
      unless Filander.behavior == :pretend
        if Filander.verbose
          system command
        else
          `#{command}`
        end
      end
    end
  end
end
