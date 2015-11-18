require 'active_support/concern'
require 'active_support/dependencies/autoload'
require 'string_attributes/strip'

module StringAttributes
  module Base
    extend ActiveSupport::Concern
    extend ActiveSupport::Autoload

    include StringAttributes::Strip

    module ClassMethods
      def attr_string(attribute, options = {})
        validate_attribute!(attribute)

        set_strip(attribute) if options[:strip]
      end

      private

      def validate_attribute!(attribute)
        unless attribute.is_a?(String) || attribute.is_a?(Symbol)
          fail StringAttributes::InvalidArgument, 'Attribute must be String or Symbol'
        end

        unless self.column_names.include? attribute.to_s
          fail StringAttributes::UnkownAttribute, "#{self.name} does not have #{attribute}"
        end

        true
      end
    end
  end
end
