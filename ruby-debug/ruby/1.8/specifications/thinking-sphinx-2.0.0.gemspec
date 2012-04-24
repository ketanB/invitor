# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "thinking-sphinx"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Allan"]
  s.date = "2010-11-14"
  s.description = "A concise and easy-to-use Ruby library that connects ActiveRecord to the Sphinx search daemon, managing configuration, indexing and searching."
  s.email = "pat@freelancing-gods.com"
  s.extra_rdoc_files = ["README.textile"]
  s.files = ["README.textile"]
  s.homepage = "http://ts.freelancing-gods.com"
  s.post_install_message = "If you're upgrading, you should read this:\nhttp://freelancing-god.github.com/ts/en/upgrading.html\n\n"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.22"
  s.summary = "ActiveRecord/Rails Sphinx library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<riddle>, [">= 1.2.0"])
      s.add_development_dependency(%q<mysql>, ["= 2.8.1"])
      s.add_development_dependency(%q<pg>, ["= 0.9.0"])
      s.add_development_dependency(%q<jeweler>, ["= 1.5.0.pre5"])
      s.add_development_dependency(%q<yard>, ["= 0.6.1"])
      s.add_development_dependency(%q<rspec>, ["= 2.0.1"])
      s.add_development_dependency(%q<rspec-core>, ["= 2.0.1"])
      s.add_development_dependency(%q<rspec-expectations>, ["= 2.0.1"])
      s.add_development_dependency(%q<rspec-mocks>, ["= 2.0.1"])
      s.add_development_dependency(%q<rcov>, ["= 0.9.8"])
      s.add_development_dependency(%q<cucumber>, ["= 0.9.4"])
      s.add_development_dependency(%q<will_paginate>, ["= 3.0.pre"])
      s.add_development_dependency(%q<ginger>, ["= 1.2.0"])
      s.add_development_dependency(%q<faker>, ["= 0.3.1"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_dependency(%q<riddle>, [">= 1.2.0"])
      s.add_dependency(%q<mysql>, ["= 2.8.1"])
      s.add_dependency(%q<pg>, ["= 0.9.0"])
      s.add_dependency(%q<jeweler>, ["= 1.5.0.pre5"])
      s.add_dependency(%q<yard>, ["= 0.6.1"])
      s.add_dependency(%q<rspec>, ["= 2.0.1"])
      s.add_dependency(%q<rspec-core>, ["= 2.0.1"])
      s.add_dependency(%q<rspec-expectations>, ["= 2.0.1"])
      s.add_dependency(%q<rspec-mocks>, ["= 2.0.1"])
      s.add_dependency(%q<rcov>, ["= 0.9.8"])
      s.add_dependency(%q<cucumber>, ["= 0.9.4"])
      s.add_dependency(%q<will_paginate>, ["= 3.0.pre"])
      s.add_dependency(%q<ginger>, ["= 1.2.0"])
      s.add_dependency(%q<faker>, ["= 0.3.1"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    s.add_dependency(%q<riddle>, [">= 1.2.0"])
    s.add_dependency(%q<mysql>, ["= 2.8.1"])
    s.add_dependency(%q<pg>, ["= 0.9.0"])
    s.add_dependency(%q<jeweler>, ["= 1.5.0.pre5"])
    s.add_dependency(%q<yard>, ["= 0.6.1"])
    s.add_dependency(%q<rspec>, ["= 2.0.1"])
    s.add_dependency(%q<rspec-core>, ["= 2.0.1"])
    s.add_dependency(%q<rspec-expectations>, ["= 2.0.1"])
    s.add_dependency(%q<rspec-mocks>, ["= 2.0.1"])
    s.add_dependency(%q<rcov>, ["= 0.9.8"])
    s.add_dependency(%q<cucumber>, ["= 0.9.4"])
    s.add_dependency(%q<will_paginate>, ["= 3.0.pre"])
    s.add_dependency(%q<ginger>, ["= 1.2.0"])
    s.add_dependency(%q<faker>, ["= 0.3.1"])
  end
end
