
# Makefile
# see https://www.gnu.org/software/make/manual/make.html


# VARIABLES

NAME := 
BUILD_TOOL := bundle exec


# Jekyll command flags
# --livereload
# --incremental
# --watch


# ACTIONS

install-jekyll :		## Install Jekyll and Bundler gems through RubyGems
	gem install jekyll bundler

new :		## Create a new Jekyll project
	jekyll new . --force

build :		## Build current Jekyll project
	$(BUILD_TOOL) jekyll build

serve :		## Build and serve current Jekyll project
	$(BUILD_TOOL) jekyll serve --livereload --watch

fetch-dependencies :		## Fetch dependencies
	$(BUILD_TOOL) update
