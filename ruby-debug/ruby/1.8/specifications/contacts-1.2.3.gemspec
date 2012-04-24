# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "contacts"
  s.version = "1.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lucas Carlson"]
  s.date = "2010-01-20"
  s.description = "A universal interface to grab contact list information from various providers including Yahoo, AOL, Gmail, Hotmail, and Plaxo."
  s.email = "lucas@rufy.com"
  s.homepage = "http://github.com/cardmagic/contacts"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.22"
  s.summary = "A universal interface to grab contact list information from various providers including Yahoo, AOL, Gmail, Hotmail, and Plaxo."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 1.1.1"])
      s.add_runtime_dependency(%q<gdata>, [">= 1.1.1"])
    else
      s.add_dependency(%q<json>, [">= 1.1.1"])
      s.add_dependency(%q<gdata>, [">= 1.1.1"])
    end
  else
    s.add_dependency(%q<json>, [">= 1.1.1"])
    s.add_dependency(%q<gdata>, [">= 1.1.1"])
  end
end
