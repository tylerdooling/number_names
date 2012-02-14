# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "number_names/version"

Gem::Specification.new do |s|
  s.name        = "number_names"
  s.version     = NumberNames::VERSION
  s.authors     = ["Tyler Dooling"]
  s.email       = ["wtdooling@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple to covert numbers to their string names.}
  s.description = %q{A simple to covert numbers to their string names.}

  s.rubyforge_project = "number_names"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # dependencies
  s.add_development_dependency "rspec"
end
