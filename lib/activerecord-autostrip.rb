require 'active_support/all'
require 'active_record'
require 'unicode-tools'
require 'autostrip/extension'

module Autostrip
  class << self
    def perform(value)
      value.squish.trim
    end

    def performable?(value)
      value.respond_to?(:trim) && value.respond_to?(:squish)
    end
  end
end

module ActiveRecord
  Base.include Autostrip::Extension
end