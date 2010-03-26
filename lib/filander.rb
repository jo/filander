require 'fileutils'
require 'filander/actions/base'
require 'filander/actions/copy_file'
require 'filander/actions/create_file'
require 'filander/actions/empty_directory'
require 'filander/actions/inject_into_file'
require 'filander/actions/inside'
require 'filander/actions/template'

module Filander
  class << self
    attr_accessor :source_root, :destination_root
  end

  include CopyFile
  include CreateFile
  include EmptyDirectory
  include InjectIntoFile
  include Inside
  include Template
end
