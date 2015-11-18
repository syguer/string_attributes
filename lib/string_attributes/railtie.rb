module StringAttributes
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load :acrive_record do
      ActiveRecord::Base.send(:include, StringAttributes::Base)
    end
  end
end
