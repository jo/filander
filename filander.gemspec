# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{filander}
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Johannes J. Schmidt"]
  s.date = %q{2010-05-06}
  s.description = %q{Helps dealing with files and directories}
  s.email = %q{schmidt@netzmerk.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "lib/filander.rb",
     "lib/filander/actions/base.rb",
     "lib/filander/actions/chown.rb",
     "lib/filander/actions/cmd.rb",
     "lib/filander/actions/copy_directory.rb",
     "lib/filander/actions/copy_file.rb",
     "lib/filander/actions/create_file.rb",
     "lib/filander/actions/empty_directory.rb",
     "lib/filander/actions/gem_install.rb",
     "lib/filander/actions/git_clone.rb",
     "lib/filander/actions/inject_into_file.rb",
     "lib/filander/actions/inside.rb",
     "lib/filander/actions/template.rb"
  ]
  s.homepage = %q{http://github.com/jo/filander}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{File manipulation tools}
  s.test_files = [
    "spec/filander_spec.rb",
     "spec/spec_helper.rb",
     "spec/filander/actions/copy_directory_spec.rb",
     "spec/filander/actions/inside_spec.rb",
     "spec/filander/actions/copy_file_spec.rb",
     "spec/filander/actions/inject_into_file_spec.rb",
     "spec/filander/actions/chown_spec.rb",
     "spec/filander/actions/template_spec.rb",
     "spec/filander/actions/empty_directory_spec.rb",
     "spec/filander/actions/create_file_spec.rb",
     "spec/filander/actions/gem_install_spec.rb",
     "spec/filander/actions/base_spec.rb",
     "spec/filander/actions/cmd_spec.rb",
     "spec/filander/actions/git_clone_spec.rb",
     "spec/source",
     "spec/source/myfile",
     "spec/source/mydir",
     "spec/source/mydir/myfile",
     "spec/source/mydir/mytemplate",
     "spec/source/mytemplate",
     "spec/spec.opts",
     "spec/filander",
     "spec/filander/actions"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

