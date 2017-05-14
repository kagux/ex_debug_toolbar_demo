# ExDebugToolbar Demo

## Install

Install `docker` and `docker-compose`

Run `sh <(curl -fsSL https://raw.githubusercontent.com/kagux/ex_debug_toolbar_demo/master/install.sh)` to download the demo app, with the toolbar inside prepared for development 

Run `bin/docker-launcher server` to start the server

## Development
The following tools are available

  * `bin/docker-launcher init` to prepare docker containers and services
  * `bin/docker-launcher server` to start server
  * `bin/docker-launcher psql` to enter psql
  * `bin/docker-launcher web_console` to enter app console

Or you can use [tmuxinator config](https://github.com/kagux/dotfiles/blob/master/home/.tmuxinator/ex_debug_toolbar.yml) that does it all.
Now you can visit [`web.ex_debug_toolbar_demo.docker`](http://web.ex_debug_toolbar_demo.docker) from your browser.
