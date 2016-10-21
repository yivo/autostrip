# frozen_string_literal: true
require 'active_model'
require 'unicode-tools'
require 'autostrip/extension'

module Autostrip
  class << self
    def perform(value)
      value.squish.trim
    end

    def performable?(value)
      value.kind_of?(String)
    end
  end
end

module ActiveModel::Validations::HelperMethods
  include Autostrip::Extension
end

if defined?(ActiveRecord::Base) && !ActiveRecord::Base.methods.include?(:autostrip)
  class ActiveRecord::Base
    extend Autostrip::Extension
  end
end
