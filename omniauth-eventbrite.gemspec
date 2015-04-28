# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/eventbrite/version'

Gem::Specification.new do |spec|
  spec.name        = 'omniauth-eventbrite'
  spec.version     = Omniauth::Eventbrite::VERSION
  spec.authors     = ['Kruttik Aggarwal']
  spec.email       = ['kruttikagarwal@gmail.com']
  spec.homepage    = 'https://github.com/k504866430/omniauth-eventbrite'
  spec.summary     = 'Eventbrite OAuth2 strategy for OmniAuth'
  spec.description = spec.summary

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 2.7.0'
  spec.add_development_dependency 'rake'
end
