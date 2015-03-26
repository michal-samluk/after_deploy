# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "after_deploy/version"

Gem::Specification.new do |s|
  s.name = 'after_deploy'
  s.version = AfterDeploy::VERSION
  s.authors = %w(Michał\ Samluk)
  s.summary = 'TBA'
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.homepage    = "https://github.com/michal-samluk/after_deploy"

  s.add_dependency 'hipchat'

  s.add_development_dependency 'rake', '>= 0.9.2'
  s.add_development_dependency 'rspec', '~> 3.0.0'
  s.add_development_dependency 'rspec-mocks', '~> 3.0.0'
  s.add_development_dependency 'rails'

end