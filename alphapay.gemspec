$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'alphapay/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'alphapay'
  s.version     = AlphaPay::VERSION
  s.authors     = ['Nelson Lee']
  s.email       = ['ilung.me@gmail.com']
  s.homepage    = 'http://alphapay.ca'
  s.summary     = 'AlphaPay Gateway Integration'
  s.description = 'This is a gem for integrating with AlphaPay Gateway'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_development_dependency 'awesome_print', '~> 1.6'
  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'webmock', '~> 1.22'

  s.add_runtime_dependency 'rest-client', '~> 2.0'
end
