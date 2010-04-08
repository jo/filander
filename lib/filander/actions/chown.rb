module Filander
  module Chown
    include Base

    def chown(filename, user)
      report :chown, "#{user} #{filename}"
      unless Filander.behavior == :pretend
        system "chown -R #{user} #{join_destination(filename)}"
      end
    end
  end
end
