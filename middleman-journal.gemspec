$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'middleman-journal/version'

Gem::Specification.new do |s|
  s.name        = 'middleman-journal'
  s.version     = Middleman::Journal::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Mauro Morales']
  s.email       = ['mauro@mrls.xyz']
  s.homepage    = 'http://github.com/mrls/middleman-journal'
  s.summary     = 'Middleman Journal Engine Extension'
  s.description = 'Middleman Journal Engine Extension'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.1.0'

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency('middleman-core', ['>= 4.2.1'])

  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
