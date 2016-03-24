require 'active_support/all'
require 'active_record'
require 'unicode-tools'
require 'autostrip/extension'

module ActiveRecord
  Base.include Autostrip::Extension
end