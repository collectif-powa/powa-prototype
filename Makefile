# 
#
all: help

prepare: ## install system dependencies
	bundle install

watch: ## run development server
	bundle exec jekyll serve

serve: watch ## run development server (alias for watch)

build: ## build static pages
	bundle exec jekyll build

help: ## print this help
	@echo "Usage: make <target>"
	@echo ""
	@echo "With one of following targets:"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "} \
  	  /^[a-zA-Z_-]+:.*?## / \
  	  { sub("\\\\n",sprintf("\n%22c"," "), $$2); \
        	printf("\033[36m%-20s\033[0m %s\n", $$1, $$2); \
  	  }' $(MAKEFILE_LIST)
	@echo ""
