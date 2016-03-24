# encoding: utf-8

Gem::Specification.new do |s|
  s.name            = 'autostrip'
  s.version         = '1.0.0'
  s.authors         = ['Yaroslav Konoplov']
  s.email           = ['yaroslav@inbox.com']
  s.summary         = 'Automatically trim and squish ActiveRecord::Base attributes'
  s.description     = 'Automatically trim and squish ActiveRecord::Base attributes'
  s.homepage        = 'http://github.com/yivo/autostrip'
  s.license         = 'MIT'

  s.executables     = `git ls-files -z -- bin/*`.split("\x0").map{ |f| File.basename(f) }
  s.files           = `git ls-files -z`.split("\x0")
  s.test_files      = `git ls-files -z -- {test,spec,features}/*`.split("\x0")
  s.require_paths   = ['lib']

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'test-unit', '~> 3.1.8'
end