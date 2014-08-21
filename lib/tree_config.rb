require "tree_config/version"
require 'active_support/core_ext'
require 'tree_config/vendor/directory_tree'
require 'tree_config/vendor/deep_struct'
require 'tree_config/error'

module TreeConfig
  @@_ran_once = false

  mattr_accessor :const_name
  @@const_name = "Settings"
  
  def default_config_folder
    @@folder = "setting"
  end
  
  def self.setup
    yield self if @@_ran_once == false
    @@_ran_once = true
  end

  def self._load(root_folder)
    return DirectoryTree.load(root_folder, DeepStruct.new)
  end

  def self.load(root_folder=nil)
    raise FolderNotDefine unless root_folder and File.directory? root_folder
    Kernel.send(:remove_const, TreeConfig.const_name) if Kernel.const_defined?(TreeConfig.const_name)
    Kernel.const_set(TreeConfig.const_name, TreeConfig._load(root_folder))
  end
end

require('tree_config/integration/rails') if defined?(::Rails)
