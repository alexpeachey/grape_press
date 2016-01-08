module GrapePress
  module Tree
    private

    def generate_tree
      generate_app_tree
      generate_bin_tree
      generate_config_tree
      generate_spec_tree
      generate_database_tree
      generate_models_tree
    end

    def generate_app_tree
      empty_directory app_name
      empty_directory File.join(app_name, 'app')
      empty_directory File.join(app_name, 'app', 'api')
      empty_directory File.join(app_name, 'app', 'api', "v#{api_version}")
      empty_directory File.join(app_name, 'app', 'api', "v#{api_version}", 'entities')
    end

    def generate_bin_tree
      empty_directory File.join(app_name, 'bin')
    end

    def generate_config_tree
      empty_directory File.join(app_name, 'config')
      empty_directory File.join(app_name, 'config', 'environments')
      empty_directory File.join(app_name, 'config', 'initializers')
      empty_directory File.join(app_name, 'config', 'locales')
    end

    def generate_spec_tree
      empty_directory File.join(app_name, 'spec')
      empty_directory File.join(app_name, 'spec', 'support')
    end

    def generate_database_tree
      return unless active_record
      empty_directory File.join(app_name, 'db')
      empty_directory File.join(app_name, 'db', 'migrations')
    end

    def generate_models_tree
      return unless active_record || mongoid
      empty_directory File.join(app_name, 'app', 'models')
      empty_directory File.join(app_name, 'spec', 'models')
    end
  end
end
