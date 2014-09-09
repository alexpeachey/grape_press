module GrapePress
  module Configuration
    attr_reader :app_name, :app_class, :active_record, :database, :mongoid

    private

    def collect(name)
      @app_name = name.underscore
      @app_class = name.camelize
      @active_record = yes? 'Use ActiveRecord?'
      @database = if active_record
        ask 'Database?', limited_to: ['pg', 'mysql', 'sqlite', 'other']
      else
        :none
      end
      @mongoid = if active_record
        false
      else
        yes? 'Use Mongoid?'
      end
      self
    end
  end
end
