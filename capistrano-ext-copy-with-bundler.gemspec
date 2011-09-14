# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.autorequire = false
  
  s.name        = "capistrano-ext-copy-with-bundler"
  s.version     = "0.0.1"
  
  s.authors     = ["Rudolf Schmidt"]
  s.homepage    = "http://github.com/rudionrails/capistrano-ext-copy-with-bundler"
  
  s.summary     = %q{Capistrano recipe to deploy via :copy with already bundled gems}
  s.description = %q{Not every server allows access to rubygems or other repository sources, we I needed a way to get the gems pre-bundled}

  s.rubyforge_project = "capistrano-ext-copy-with-bundler"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "capistrano", "~> 2"
end
