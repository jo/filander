# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{filander}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Johannes J. Schmidt"]
  s.date = %q{2010-03-26}
  s.description = %q{Helps you dealing with files and directories}
  s.email = %q{schmidt@netzmerk.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/actions/base.rb",
     "lib/actions/copy_file.rb",
     "lib/actions/create_file.rb",
     "lib/actions/empty_directory.rb",
     "lib/actions/inject_into_file.rb",
     "lib/actions/inside.rb",
     "lib/actions/template.rb",
     "lib/filander.rb",
     "spec/actions/base_spec.rb",
     "spec/actions/copy_file_spec.rb",
     "spec/actions/create_file_spec.rb",
     "spec/actions/empty_directory_spec.rb",
     "spec/actions/inject_into_file_spec.rb",
     "spec/actions/inside_spec.rb",
     "spec/actions/template_spec.rb",
     "spec/filander_spec.rb",
     "spec/source/mydir/myfile",
     "spec/source/mydir/mytemplate",
     "spec/source/myfile",
     "spec/source/mytemplate",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/jo/filander}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{File manipulation tools}
  s.test_files = [
    "spec/filander_spec.rb",
     "spec/spec_helper.rb",
     "spec/actions/inside_spec.rb",
     "spec/actions/copy_file_spec.rb",
     "spec/actions/inject_into_file_spec.rb",
     "spec/actions/template_spec.rb",
     "spec/actions/empty_directory_spec.rb",
     "spec/actions/create_file_spec.rb",
     "spec/actions/base_spec.rb"
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

