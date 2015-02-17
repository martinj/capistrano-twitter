# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "capistrano-twitter"
  s.version     = "1.0.1"
  s.authors     = ["Martin Jonsson"]
  s.email       = ["martin.jonsson@gmail.com"]
  s.homepage    = "http://github.com/martinj/capistrano-twitter"
  s.summary     = "Capistrano recipe for twitter"
  s.description = "Capistrano recipe to send message to twitter"
  s.files       = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.add_runtime_dependency 'colored', '~> 1.2'
  s.add_runtime_dependency 'twitter', '~> 5.14'
  s.license = 'MIT'
end