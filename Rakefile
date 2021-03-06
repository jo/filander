require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "filander"
    gem.summary = %Q{File manipulation tools}
    gem.description = %Q{Helps dealing with files and directories}
    gem.email = "schmidt@netzmerk.com"
    gem.homepage = "http://github.com/jo/filander"
    gem.authors = ["Johannes J. Schmidt"]
    gem.require_path = "lib"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.files = Dir.glob("lib/**/*")
    gem.test_files.include 'spec/**/*'
    gem.has_rdoc = true
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "filander #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
