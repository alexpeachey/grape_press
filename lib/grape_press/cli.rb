require 'thor'
require 'active_support/inflector'
require 'grape_press/configuration'
require 'grape_press/tree'
require 'grape_press/files'

module GrapePress
  class Cli < Thor
    include Thor::Actions
    include Configuration
    include Tree
    include Files

    def self.source_root
      File.dirname(__FILE__)
    end

    desc 'new APP', 'Generate a new Grape API Application'
    def new(name)
      collect(name)
      generate_tree
      generate_files
    end

    desc 'destroy APP', 'Destroy Application'
    def destroy(name)
      remove_dir name.underscore
    end
  end
end
