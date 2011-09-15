# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'capistrano-strategy-copy-working-dir'

Gem::Specification.new do |s|
  s.autorequire = false
  
  s.name        = "capistrano-strategy-copy-working-dir"
  s.version     = CapistranoStrategyCopyWorkingDir::VERSION
  
  s.authors     = ["Rudolf Schmidt"]
  s.homepage    = "http://github.com/rudionrails/capistrano-strategy-copy-working-dir"
  
  s.summary     = %q{Capistrano copy recipe to transfer files from the current working directory}
  s.description = %q{Not every server allows access to rubygems or other repository sources, so this is just to make life a little easier}

  s.rubyforge_project = "capistrano-strategy-copy-working-dir"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "capistrano", "~> 2"
end
