# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "globalize3"
  s.version = "0.0.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven Fuchs", "Joshua Harvey", "Clemens Kofler", "John-Paul Bader"]
  s.date = "2011-01-11"
  s.description = "Rails I18n: de-facto standard library for ActiveRecord 3 model/data translation."
  s.email = "nobody@globalize-rails.org"
  s.homepage = "http://github.com/svenfuchs/globalize3"
  s.require_paths = ["lib"]
  s.rubyforge_project = "[none]"
  s.rubygems_version = "1.8.22"
  s.summary = "Rails I18n: de-facto standard library for ActiveRecord 3 model/data translation"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<activemodel>, [">= 3.0.0"])
      s.add_development_dependency(%q<database_cleaner>, ["= 0.5.2"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<pathname_local>, [">= 0"])
      s.add_development_dependency(%q<test_declarative>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_dependency(%q<activemodel>, [">= 3.0.0"])
      s.add_dependency(%q<database_cleaner>, ["= 0.5.2"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<pathname_local>, [">= 0"])
      s.add_dependency(%q<test_declarative>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    s.add_dependency(%q<activemodel>, [">= 3.0.0"])
    s.add_dependency(%q<database_cleaner>, ["= 0.5.2"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<pathname_local>, [">= 0"])
    s.add_dependency(%q<test_declarative>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
  end
end
