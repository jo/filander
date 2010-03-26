require 'fileutils'
require 'lib/actions/base'

require 'lib/actions/copy_file'
require 'lib/actions/create_file'
require 'lib/actions/empty_directory'
require 'lib/actions/inject_into_file'
require 'lib/actions/inside'
require 'lib/actions/template'

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
