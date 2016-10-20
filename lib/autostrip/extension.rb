# frozen_string_literal: true
module Autostrip
  module Extension
    def autostrip(*attributes)
      attributes.each do |attribute|
        before_validation do |model|
          value = model.send(attribute)
          if Autostrip.performable?(value)
            # http://www.davidverhasselt.com/set-attributes-in-activerecord/
            model.send("#{attribute}=", Autostrip.perform(value))
          end
        end
      end
    end
  end
end
