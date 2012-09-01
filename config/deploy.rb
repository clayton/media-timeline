require "bundler/capistrano"
begin
  require 'capistrano_colors'
rescue LoadError
end

set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'

set :application, "media-timeline"
set :repository,  "git@github.com:clayton/media-timeline"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "themediatimeline.com"                          # Your HTTP server, Apache/etc
role :app, "themediatimeline.com"                          # This may be the same as your `Web` server
role :db,  "themediatimeline.com", :primary => true # This is where Rails migrations will run

set :use_sudo, false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:user] = "deploy"
ssh_options[:password] = "d3pl0y"

set :deploy_to, '/home/deploy/apps/media-timeline'
# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:migrate"
after "deploy:update_code", "deploy:precompile_assets"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
   desc "precompile the assets"
  task :precompile_assets, :roles => :web, :except => { :no_release => true } do
    run "cd #{release_path}; rm -rf public/assets/*"
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end

  # task :scrape do
  #   run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake scraper:scrape"
  # end

  # task :wipe do
  #   run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake scraper:wipe"
  # end
end