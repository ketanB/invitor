# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "geokit-rails3"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andre Lewis", "Bill Eisenhauer", "Jeremy Lecour"]
  s.date = "2010-10-17"
  s.description = "Port of the Rails plugin \"geokit-rails\" to Rails 3, as a gem"
  s.email = ["andre@earthcode.com", "bill_eisenhauer@yahoo.com", "jeremy.lecour@gmail.com"]
  s.homepage = "http://github.com/jlecour/geokit-rails3"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.22"
  s.summary = "Integrate Geokit with Rails 3"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<geokit>, ["~> 1.5.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rcov>, ["~> 0.9.9"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9.8"])
      s.add_development_dependency(%q<mysql>, ["~> 2.8.1"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_dependency(%q<geokit>, ["~> 1.5.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<rcov>, ["~> 0.9.9"])
      s.add_dependency(%q<mocha>, ["~> 0.9.8"])
      s.add_dependency(%q<mysql>, ["~> 2.8.1"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0.0"])
    s.add_dependency(%q<geokit>, ["~> 1.5.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<rcov>, ["~> 0.9.9"])
    s.add_dependency(%q<mocha>, ["~> 0.9.8"])
    s.add_dependency(%q<mysql>, ["~> 2.8.1"])
  end
end
