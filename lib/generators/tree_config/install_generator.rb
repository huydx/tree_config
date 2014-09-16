module TreeConfig
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Generates a custom Tree Config initializer file."

      def self.source_root
        @_tree_config_source_root ||= File.expand_path('../templates', __FILE__)
      end
      
      def copy_initializer
        template "tree_config.rb", "config/initializers/tree_config.rb"
      end

      def copy_settings 
        directory "settings", "config/settings"
      end
    end
  end
end
