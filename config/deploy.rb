require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/rbenv"
load "config/recipes/check"

server "ec2-176-34-18-70.ap-northeast-1.compute.amazonaws.com", :web, :app, :db

set :user, "ubuntu"
set :application, "meetin"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "https://github.com/xuluan/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:keys] = ["/home/xuluan/.ssh/xu_jp.pem"]

after "deploy", "deploy:cleanup" # keep only the last 5 releases
