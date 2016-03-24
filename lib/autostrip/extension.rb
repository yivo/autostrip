module Autostrip
  module Extension
    module ClassMethods
      def autostrip(*attributes)
        attributes.each do |attribute|
          before_validation do |model|
            value = model.send(attribute)
            model.send("#{attribute}=", value.squish.trim) if value.kind_of?(String)
          end
        end
      end
    end
  end
end