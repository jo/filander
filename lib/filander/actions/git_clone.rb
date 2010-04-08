module Filander
  module GitClone
    include Base

    def git_clone(repository, destination)
      report :cloning, repository
      unless Filander.behavior == :pretend
        system "git clone #{repository} #{destination}"
      end
    end
  end
end
