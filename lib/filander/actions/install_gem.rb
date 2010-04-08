module Filander
  module InstallGem
    include Base

    def install_gem(name, version = nil)
      if version
        gem_args = [name, version]
        gem_install_args = "-v=#{version} #{name}"
        report_name = "#{name} #{version}"
      else
        gem_args = [name]
        gem_install_args = name
        report_name = name
      end
      report :install, report_name
      unless Filander.behavior == :pretend
        begin
          gem *gem_args
        rescue => Gem::LoadError
          cmd "gem install #{gem_install_args}"
        end
      end
    end
  end
end
