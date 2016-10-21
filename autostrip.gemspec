# frozen_string_literal: true
Gem::Specification.new do |s|
  s.name            = 'autostrip'
  s.version         = '1.0.2'
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

  s.add_runtime_dependency 'activemodel', '>= 3.0', '< 6.0'
end
