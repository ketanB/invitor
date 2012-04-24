# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tiny_mce"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.4") if s.respond_to? :required_rubygems_version=
  s.authors = ["Blake Watters", "Kieran Pilkington", "Sergio Cambra", "Alexander Semyonov", "Marian Theisen"]
  s.date = "2010-04-12"
  s.description = "Gem that allows easy implementation of the TinyMCE editor into your applications."
  s.email = "kieran@katipo.co.nz"
  s.extra_rdoc_files = ["CHANGELOG_PLUGIN.rdoc", "DEV_UPGRADE_NOTES.rdoc", "README.rdoc", "SPELLCHECKING_PLUGIN.rdoc"]
  s.files = ["CHANGELOG_PLUGIN.rdoc", "DEV_UPGRADE_NOTES.rdoc", "README.rdoc", "SPELLCHECKING_PLUGIN.rdoc"]
  s.homepage = "http://github.com/kete/tiny_mce"
  s.rdoc_options = ["--charset=UTF-8", "--exclude=lib/tiny_mce/assets"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.22"
  s.summary = "TinyMCE editor for your rails applications."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
