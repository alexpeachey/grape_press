module GrapePress
  module Files
    private

    def generate_files
      generate_core_files
      generate_app_files
      generate_bin_files
      generate_config_files
      generate_spec_files
      generate_database_files
      generate_mongoid_files
    end

    def generate_core_files
      template File.join('templates', 'readme.md.erb'), File.join(app_name, 'README.md')
      template File.join('templates', 'config.ru.erb'), File.join(app_name, 'config.ru')
      template File.join('templates', 'Gemfile.erb'), File.join(app_name, 'Gemfile')
      template File.join('templates', 'Guardfile.erb'), File.join(app_name, 'Guardfile')
      template File.join('templates', 'Rakefile.erb'), File.join(app_name, 'Rakefile')
      template File.join('templates', 'dot_rspec.erb'), File.join(app_name, '.rspec')
    end

    def generate_app_files
      template File.join('templates', 'app', 'application.rb.erb'), File.join(app_name, 'app', 'application.rb')
      template File.join('templates', 'app', 'api', 'api.rb.erb'), File.join(app_name, 'app', 'api', 'api.rb')
      template File.join('templates', 'app', 'api', "versioned", 'api.rb.erb'), File.join(app_name, 'app', 'api', "v#{api_version}", 'api.rb')
    end

    def generate_bin_files
      template File.join('templates', 'bin', 'console.erb'), File.join(app_name, 'bin', 'console')
      chmod File.join(app_name, 'bin', 'console'), 0755
    end

    def generate_config_files
      template File.join('templates', 'config', 'environment.rb.erb'), File.join(app_name, 'config', 'environment.rb')
      template File.join('templates', 'config', 'locales', 'en.yml.erb'), File.join(app_name, 'config', 'locales', 'en.yml')
    end

    def generate_spec_files
      if active_record
        template File.join('templates', 'spec', 'spec_helper_ar.rb.erb'), File.join(app_name, 'spec', 'spec_helper.rb')
      elsif mongoid
        template File.join('templates', 'spec', 'spec_helper_mongoid.rb.erb'), File.join(app_name, 'spec', 'spec_helper.rb')
      else
        template File.join('templates', 'spec', 'spec_helper.rb.erb'), File.join(app_name, 'spec', 'spec_helper.rb')
      end
    end

    def generate_database_files
      return unless active_record
      template File.join('templates', 'config', 'initializers', 'active_record.rb.erb'), File.join(app_name, 'config', 'initializers', 'active_record.rb')
      if database == 'pg'
        template File.join('templates', 'config', 'database_pg.yml.erb'), File.join(app_name, 'config', 'database.yml')
      elsif database == 'mysql'
        template File.join('templates', 'config', 'database_mysql.yml.erb'), File.join(app_name, 'config', 'database.yml')
      elsif database == 'sqlite'
        template File.join('templates', 'config', 'database_sqlite.yml.erb'), File.join(app_name, 'config', 'database.yml')
      end
    end

    def generate_mongoid_files
      return unless mongoid
      template File.join('templates', 'config', 'initializers', 'mongoid.rb.erb'), File.join(app_name, 'config', 'initializers', 'mongoid.rb')
      template File.join('templates', 'config', 'mongoid.yml.erb'), File.join(app_name, 'config', 'mongoid.yml')
    end
  end
end
