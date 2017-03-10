# encoding: UTF-8
# frozen_string_literal: true

require 'active_model'
require 'unicode-tools'
require 'autostrip/extension'

module Autostrip
  class << self
    def perform(value)
      value.squish
    end

    def performable?(value)
      String === value
    end
  end
end

ActiveModel.include Autostrip::Extension
ActiveSupport.on_load(:active_record) { ActiveRecord::Base.include Autostrip::Extension }
