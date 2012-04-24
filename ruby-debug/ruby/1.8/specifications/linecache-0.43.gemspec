# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "linecache"
  s.version = "0.43"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["R. Bernstein"]
  s.cert_chain = nil
  s.date = "2008-06-12"
  s.description = "LineCache is a module for reading and caching lines. This may be useful for example in a debugger where the same lines are shown many times."
  s.email = "rockyb@rubyforge.net"
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["README", "lib/linecache.rb", "lib/tracelines.rb"]
  s.files = ["README", "lib/linecache.rb", "lib/tracelines.rb", "ext/extconf.rb"]
  s.homepage = "http://rubyforge.org/projects/rocky-hacks/linecache"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.2")
  s.rubyforge_project = "rocky-hacks"
  s.rubygems_version = "1.8.22"
  s.summary = "Read file with caching"

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
