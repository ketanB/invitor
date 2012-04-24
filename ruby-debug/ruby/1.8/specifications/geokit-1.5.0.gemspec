# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "geokit"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andre Lewis"]
  s.date = "2009-09-21"
  s.description = ""
  s.email = ["andre@earthcode.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = ["History.txt", "Manifest.txt"]
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "geokit"
  s.rubygems_version = "1.8.22"
  s.summary = "Geokit provides geocoding and distance calculation in an easy-to-use API"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.12.2"])
    else
      s.add_dependency(%q<hoe>, [">= 1.12.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.12.2"])
  end
end
