#!/bin/bash

# Load RVM into the shell
source "/usr/local/rvm/bin/rvm"

# Switch to the right RVM version
rvm 1.9.3

# CD to the rails app
cd  /home/ubuntu/git/meetin
bundle exec unicorn -c config/unicorn.rb -D -E production

