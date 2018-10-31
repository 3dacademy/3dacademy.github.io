
# Makefile
# see https://www.gnu.org/software/make/manual/make.html


## CONFIGS
.PHONY: help
.DEFAULT_GOAL := help


## JEKYLL

install-jekyll :		## Install Jekyll gem using RubyGems
	gem install jekyll

update-jekyll :		## Update Jekyll using gem
	gem update jekyll


## BUNDLER

install-bundler :		## Install Bundler gem using RubyGems
	gem install bundler

install-gems :		## Install gems specified by Gemfile or Gemfile.lock
	bundle install

check-gems :		## Determine whether the requirements for your application are installed
	bundle check

list-gems :		## Show all of the gems in the current bundle
	bundle list

update-gems :		## Update gems to their latest versions
	bundle update

outdated-gems :		## Show all of the outdated gems in the current bundle
	bundle outdated

compatibility-info :		## Display platform compatibility information
	bundle platform


## DEV

clean :		## Clean project
	rm -rf _site .sass-cache

build :		## Build project
	bundle exec jekyll build

# available flags:
# 	--livereload
# 	--incremental
# 	--watch
serve :		## Serve project
	bundle exec jekyll serve --livereload --watch


## OTHERS

new :		## Create a new Jekyll project
	jekyll new . --force


## GENERAL

help :		## Help
	@echo ""
	@echo "*** $(NAME) Makefile help ***"
	@echo ""
	@echo "Targets list:"
	@grep -E '^[a-zA-Z_-]+ :.*?## .*$$' $(MAKEFILE_LIST) | sort -k 1,1 | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ""
