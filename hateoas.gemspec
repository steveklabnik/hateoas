# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hateoas/version"

Gem::Specification.new do |s|
  s.name        = "hateoas"
  s.version     = Hateoas::VERSION
  s.authors     = ["Steve Klabnik"]
  s.email       = ["steve@steveklabnik.com"]
  s.homepage    = "http://steveklabnik.github.com/hateoas"
  s.summary     = %q{Build easy clients for Hypermedia APIs.}
  s.description = %q{A set of tools to help build clients for Hypermedia APIs.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "mechanize"

  s.add_development_dependency "rspec"
end
