APP_NAME=kali

# This will output the help for each task
.PHONY: help

help: ## List available commands
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# DOCKER TASKS
build: ## Build the container
	docker build -t $(APP_NAME) .

run: ## Run the container
	docker run --rm -it --name $(APP_NAME) -p 9020:8080 -p 9021:5900 $(APP_NAME)

stop: ## Stop the container
	docker stop $(APP_NAME)