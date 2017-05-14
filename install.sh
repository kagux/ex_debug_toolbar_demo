#!/bin/sh

# Cancel everything if minimun dependencies are not met
if ! hash git 2>/dev/null; then
  echo 'Git is a mandatory dependency'
  exit 1
fi
# Storing the current directory to go back later
original_pwd=$(pwd)

git clone git@github.com:kagux/ex_debug_toolbar_demo.git

cd ex_debug_toolbar_demo

git clone git@github.com:kagux/ex_debug_toolbar.git

bin/docker-dev init
bin/docker-dev run web mix local.hex --force
bin/docker-dev run web mix local.rebar --force
bin/docker-dev run web mix deps.get
bin/docker-dev run web npm install
bin/docker-dev run web sh -c "cd ex_debug_toolbar && mix deps.get"
bin/docker-dev run web sh -c "cd ex_debug_toolbar && ../node_modules/brunch/bin/brunch build"
