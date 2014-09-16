module TreeConfig
  module Rails
    if defined?(Rails::Railtie)
      class Railtie < Rails::Railtie
        initializer :load_custom_tree_config, :before => :load_environment_config, :group => :all do
          initializer = Rails.root.join("config", "initializer", "hekk_config.rb")
          require initializer if File.exists?(initializer)
        end

        initializer :load_tree_config_settings, :after => :load_custom_rails_config, :before => :load_environment_config, :group => :all do
          HekkConfig.load(Rails.root.join("config", "settings"))
        end
      end
    end
  end
end
