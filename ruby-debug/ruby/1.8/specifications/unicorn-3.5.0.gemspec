# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "unicorn"
  s.version = "3.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Unicorn hackers"]
  s.date = "2011-03-15"
  s.description = "\\Unicorn is an HTTP server for Rack applications designed to only serve\nfast clients on low-latency, high-bandwidth connections and take\nadvantage of features in Unix/Unix-like kernels.  Slow clients should\nonly be served by placing a reverse proxy capable of fully buffering\nboth the the request and response in between \\Unicorn and slow clients."
  s.email = "mongrel-unicorn@rubyforge.org"
  s.executables = ["unicorn", "unicorn_rails"]
  s.extensions = ["ext/unicorn_http/extconf.rb"]
  s.extra_rdoc_files = ["FAQ", "README", "TUNING", "PHILOSOPHY", "HACKING", "DESIGN", "CONTRIBUTORS", "LICENSE", "SIGNALS", "KNOWN_ISSUES", "TODO", "NEWS", "ChangeLog", "LATEST", "lib/unicorn.rb", "lib/unicorn/app/exec_cgi.rb", "lib/unicorn/app/inetd.rb", "lib/unicorn/app/old_rails.rb", "lib/unicorn/app/old_rails/static.rb", "lib/unicorn/cgi_wrapper.rb", "lib/unicorn/configurator.rb", "lib/unicorn/const.rb", "lib/unicorn/http_request.rb", "lib/unicorn/http_response.rb", "lib/unicorn/http_server.rb", "lib/unicorn/launcher.rb", "lib/unicorn/oob_gc.rb", "lib/unicorn/preread_input.rb", "lib/unicorn/socket_helper.rb", "lib/unicorn/stream_input.rb", "lib/unicorn/tee_input.rb", "lib/unicorn/tmpio.rb", "lib/unicorn/util.rb", "lib/unicorn/worker.rb", "ext/unicorn_http/unicorn_http.c", "ISSUES", "Sandbox"]
  s.files = ["bin/unicorn", "bin/unicorn_rails", "FAQ", "README", "TUNING", "PHILOSOPHY", "HACKING", "DESIGN", "CONTRIBUTORS", "LICENSE", "SIGNALS", "KNOWN_ISSUES", "TODO", "NEWS", "ChangeLog", "LATEST", "lib/unicorn.rb", "lib/unicorn/app/exec_cgi.rb", "lib/unicorn/app/inetd.rb", "lib/unicorn/app/old_rails.rb", "lib/unicorn/app/old_rails/static.rb", "lib/unicorn/cgi_wrapper.rb", "lib/unicorn/configurator.rb", "lib/unicorn/const.rb", "lib/unicorn/http_request.rb", "lib/unicorn/http_response.rb", "lib/unicorn/http_server.rb", "lib/unicorn/launcher.rb", "lib/unicorn/oob_gc.rb", "lib/unicorn/preread_input.rb", "lib/unicorn/socket_helper.rb", "lib/unicorn/stream_input.rb", "lib/unicorn/tee_input.rb", "lib/unicorn/tmpio.rb", "lib/unicorn/util.rb", "lib/unicorn/worker.rb", "ext/unicorn_http/unicorn_http.c", "ISSUES", "Sandbox", "ext/unicorn_http/extconf.rb"]
  s.homepage = "http://unicorn.bogomips.org/"
  s.rdoc_options = ["-t", "Unicorn: Rack HTTP server for fast clients and Unix", "-W", "http://bogomips.org/unicorn.git/tree/%s"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "mongrel"
  s.rubygems_version = "1.8.22"
  s.summary = "Rack HTTP server for fast clients and Unix"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<kgio>, ["~> 2.3"])
      s.add_development_dependency(%q<isolate>, ["~> 3.0.0"])
      s.add_development_dependency(%q<wrongdoc>, ["~> 1.5"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<kgio>, ["~> 2.3"])
      s.add_dependency(%q<isolate>, ["~> 3.0.0"])
      s.add_dependency(%q<wrongdoc>, ["~> 1.5"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<kgio>, ["~> 2.3"])
    s.add_dependency(%q<isolate>, ["~> 3.0.0"])
    s.add_dependency(%q<wrongdoc>, ["~> 1.5"])
  end
end
