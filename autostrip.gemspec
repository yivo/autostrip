# encoding: UTF-8
# frozen_string_literal: true

require File.expand_path('../lib/autostrip/version', __FILE__)

Gem::Specification.new do |s|
  s.name            = 'autostrip'
  s.version         = Autostrip::VERSION
  s.authors         = ['Yaroslav Konoplov']
  s.email           = ['eahome00@gmail.com']
  s.summary         = 'Automatically strip leading and trailing whitespace'
  s.description     = 'Automatically strip leading and trailing whitespace'
  s.homepage        = 'http://github.com/yivo/autostrip'
  s.license         = 'MIT'

  s.executables     = `git ls-files -z -- bin/*`.split("\x0").map{ |f| File.basename(f) }
  s.files           = `git ls-files -z`.split("\x0")
  s.test_files      = `git ls-files -z -- {test,spec,features}/*`.split("\x0")
  s.require_paths   = ['lib']

  s.add_dependency 'activesupport', '>= 3.0', '< 6.0'
  s.add_dependency 'activemodel',   '>= 3.0', '< 6.0'
end
