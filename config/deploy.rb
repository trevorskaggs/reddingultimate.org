# config/deploy.rb
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :system

# Bundler tasks
require 'bundler/capistrano'

set :application, "rua.docbenton.org"
set :repository,  "ssh://docbenton.org/home/peteg/git/reddingultimate.org.git"
set :branch, "master"

set :scm, :git

set :use_sudo, false
set(:run_method) { use_sudo ? :sudo : :run }

default_run_options[:pty] = true

set :user, "peteg"
set :group, user
set :runner, user

set :host, "#{user}@reddingultimate.org"
role :web, host
role :app, host

set :deploy_to, "/srv/www/#{application}"
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

# Unicorn control tasks
namespace :deploy do
  task :restart do
    run "if [ -f #{unicorn_pid} ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end
end
