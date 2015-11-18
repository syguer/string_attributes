require 'active_support/concern'

module StringAttributes
  module Strip
    extend ActiveSupport::Concern

    module ClassMethods
      def set_strip(attribute)
        class_eval do
          before_validation do
            __send__("#{attribute}=", __send__(attribute).strip)
          end
        end
      end
    end
  end
end
