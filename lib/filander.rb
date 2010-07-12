require 'fileutils'
require 'filander/actions/base'
require 'filander/actions/cmd'

require 'filander/actions/chown'
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

      def self.verbose(value)
        Filander.verbose = value
      end

      # can be :pretend, :skip or :force
      def self.behavior(value)
        return unless value
        Filander.behavior = value.to_sym
      end
    end
  end

  class << self
    attr_reader :source_root_stack, :destination_root_stack, :behavior
    attr_accessor :quiet, :verbose

    def behavior=(value)
      return unless value
      @behavior = value.to_sym
    end

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

    def once(type, name)
      return if remembered?(type, name)
      yield
      remember(type, name)
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

    def remember(type, name)
      @memories ||= {}
      @memories[type] ||= []
      @memories[type] << name
    end

    def remembered?(type, name)
      return unless @memories
      return unless @memories[type]
      @memories[type].include?(name)
    end
  end

  include Cmd

  include Chown
  include CopyDirectory
  include CopyFile
  include CreateFile
  include EmptyDirectory
  include InjectIntoFile
  include Inside
  include Template
end
