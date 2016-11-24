# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-ely/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-ely'
  gem.version       = OmniAuth::Ely::VERSION
  gem.homepage      = 'https://github.com/elyby/omniauth-ely'
  gem.license       = 'MIT'

  gem.authors       = ['Ely.by team', 'ErickSkrauch']
  gem.email         = ['team@ely.by', 'erickskrauch@ely.by']
  gem.description   = %q{Official OmniAuth strategy for Ely.by.}
  gem.summary       = %q{Official OmniAuth strategy for Ely.by.}

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '>= 1.1.1', '< 2.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.require_paths = ['lib']
end
