set :application, "invitar"
set :repository,  "gull@invitar.com:/opt/invitar"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :scm_username, "gull"
set :runner, "gull"
set :use_sudo, false
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/var/rails/apps/invitar"
default_run_options[:pty] = true
set :fragment_cache, "/var/rails/apps/invitar/shared/cache"

role :web, "50.16.226.210"                          # Your HTTP server, Apache/etc
role :app, "50.16.226.210"                          # This may be the same as your `Web` server
role :db,  "50.16.226.210", :primary => true # This is where Rails migrations will run
role :db,  "50.16.226.210"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end


task :symlink, :roles => [:app] do
  run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end


before "deploy:update", :roles => [:app] do
  run "cd #{current_path} && RAILS_ENV=production rake ts:stop"
end

after "deploy:update", :roles => [:app] do
  bundler
  symlink
  run "cd #{current_path} && RAILS_ENV=production rake ts:index"
  run "cd #{current_path} && RAILS_ENV=production rake ts:start"
end

task :bundler, :roles => [:app] do
  run "cd #{current_path} && RAILS_ENV=production bundle install --local"
end