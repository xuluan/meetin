require "bundler/capistrano"
require "delayed/recipes"  
load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/rbenv"
load "config/recipes/check"

server "50.18.176.76", :web, :app, :db, primary: true

set :rails_env, "production" #added for delayed job  
set :user, "ubuntu"
set :application, "meetin"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false

set :scm, "git"
set :repository, "https://github.com/xuluan/#{application}.git"
set :branch, "release"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:keys] = ["/home/xuluan/.ssh/ec2_ca.pem"]

after "deploy:stop",    "delayed_job:stop"
#after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"

after "deploy", "deploy:cleanup" # keep only the last 5 releases
