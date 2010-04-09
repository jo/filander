module Filander
  module InstallGem
    include Base

    def install_gem(name, version = nil)
      if version
        gem_install_args = "-v=#{version} #{name}"
        report_name = "#{name} #{version}"
      else
        gem_install_args = name
        report_name = name
      end
      report :install, report_name
      unless Filander.behavior == :pretend
        system "gem install #{gem_install_args}" unless gem_exists?(name, version)
      end
    end

    private

    def gem_exists?(name, version)
      Gem.path.map { |p| File.join(p, 'gems', "#{name}-#{version || '*'}") }.any? { |p| Dir[p].size > 0 }
    end
  end
end
