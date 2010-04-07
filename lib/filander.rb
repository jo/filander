require 'fileutils'
require 'filander/actions/base'
require 'filander/actions/cmd'
require 'filander/actions/copy_directory'
require 'filander/actions/copy_file'
require 'filander/actions/create_file'
require 'filander/actions/empty_directory'
require 'filander/actions/inject_into_file'
require 'filander/actions/inside'
require 'filander/actions/template'

module Filander
  def self.included(base)
    base.class_eval do
      def self.source_root(dirname)
        Filander.source_root = dirname
      end

      def self.destination_root(dirname)
        Filander.destination_root = dirname
      end

      def self.quiet(value)
        Filander.quiet = value
      end

      # can be :pretend, :skip, :force
      def self.behavior(value)
        Filander.behavior = value
      end
    end
  end

  class << self
    attr_reader :source_root_stack, :destination_root_stack
    attr_accessor :quiet, :behavior

    def source_root=(dirname)
      add_source_root dirname
    end

    def source_root
      @source_root_stack ||= []
      @source_root_stack.last
    end

    def destination_root=(dirname)
      add_destination_root dirname
    end

    def destination_root
      @destination_root_stack ||= []
      @destination_root_stack.last
    end

    private

    def add_source_root(dirname)
      @source_root_stack ||= []
      @source_root_stack.push dirname
    end

    def add_destination_root(dirname)
      @destination_root_stack ||= []
      @destination_root_stack.push dirname
    end
  end

  include Cmd
  include CopyDirectory
  include CopyFile
  include CreateFile
  include EmptyDirectory
  include InjectIntoFile
  include Inside
  include Template
end
