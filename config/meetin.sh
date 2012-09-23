#!/bin/bash
source /usr/local/rvm/scripts/rvm
rvm use 1.9.3
APP_ROOT=/home/ubuntu/git/meetin
CMD="$APP_ROOT/bin/unicorn -D -c $APP_ROOT/config/unicorn.rb -E production"
$CMD
