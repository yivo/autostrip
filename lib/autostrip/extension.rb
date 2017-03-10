# encoding: UTF-8
# frozen_string_literal: true

require 'active_support/concern'

module Autostrip
  module Extension
    extend ActiveSupport::Concern

    def attributes_for_autostrip(attrs)
      attrs.each_with_object([]) do |attr, memo|
        case attr
          when Regexp
            self.class.columns_hash.values.each { |col| memo << col.name if col.name =~ attr }
          else
            memo << attr
        end
      end
    end

    module ClassMethods
      def autostrip(*attributes)
        # Use prepend to be sure this runs before all other "before_validation" callbacks.
        before_validation prepend: true do
          attributes_for_autostrip(attributes).each do |attribute|
            value = send(attribute)
            if Autostrip.performable?(value)
              # http://www.davidverhasselt.com/set-attributes-in-activerecord/
              send("#{attribute}=", Autostrip.perform(value))
            end
          end
        end
        nil
      end
    end
  end
end
