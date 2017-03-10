# encoding: UTF-8
# frozen_string_literal: true

module Autostrip
  module Extension
    def autostrip(*attributes)
      attributes.each do |attribute|
        # Use prepend to be sure this runs before all other "before_validation" callbacks.
        before_validation prepend: true do |model|
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
