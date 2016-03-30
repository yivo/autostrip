module Autostrip
  module Extension
    extend ActiveSupport::Concern

    module ClassMethods
      def autostrip(*attributes)
        attributes.each do |attribute|
          before_validation do |model|
            value = model.send(attribute)
            if Autostrip.performable?(value)
              model.send("#{attribute}=", Autostrip.perform(value))
            end
          end
        end
      end
    end
  end
end