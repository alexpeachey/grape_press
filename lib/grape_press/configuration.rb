module GrapePress
  module Configuration
    attr_reader :api_version, :app_name, :app_class, :active_record, :database, :mongoid, :serializer

    private

    def collect(name)
      @app_name = name.underscore
      @app_class = name.camelize
      @api_version = ask 'API Version?', default: '1'
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
      @serializer = if yes? 'Use Grape Entities?'
        'grape-entity'
      elsif yes? 'Use Active Model Serializers?'
        'active_model_serializers'
      else
        'none'
      end
      self
    end
  end
end
