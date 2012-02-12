# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth/eventbrite/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-eventbrite"
  s.version     = Omniauth::Eventbrite::VERSION
  s.authors     = ["Kruttik Aggarwal"]
  s.email       = ["kruttikagarwal@gmail.com"]
  s.homepage    = "https://github.com/k504866430/omniauth-eventbrite"
  s.summary     = "EventBrite strategy for Omniauth with OAuth 2.0"
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "omniauth-eventbrite"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
