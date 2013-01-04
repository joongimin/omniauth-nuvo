# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-nuvo/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-nuvo"
  s.version     = OmniAuth::Nuvo::VERSION
  s.authors     = ["Joon Min"]
  s.email       = ["joon.min@xnuvo.com"]
  s.homepage    = "https://github.com/arunagw/omniauth-nuvo"
  s.summary     = %q{OmniAuth strategy for Nuvo}
  s.description = %q{OmniAuth strategy for Nuvo}

  s.rubyforge_project = "omniauth-nuvo"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth', '~> 1.0'
  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
end
