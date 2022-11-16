APP_NAME=kali

## ┌───────────────────────────────────────────────────────────────────┐
## │                      Docker Kali Linux                            │
## └───────────────────────────────────────────────────────────────────┘

help: ## show this help
# regex for general help
	@sed -ne "s/^##\(.*\)/\1/p" $(MAKEFILE_LIST)
# regex for makefile commands (targets)
	@printf "────────────────────────`tput bold``tput setaf 2` Make Commands `tput sgr0`────────────────────────────────\n"
	@sed -ne "/@sed/!s/\(^[^#?=]*:\).*##\(.*\)/`tput setaf 2``tput bold`\1`tput sgr0`\2/p" $(MAKEFILE_LIST)
# regex for makefile variables
	@printf "────────────────────────`tput bold``tput setaf 4` Make Variables `tput sgr0`───────────────────────────────\n"
	@sed -ne "/@sed/!s/\(.*\)?=\(.*\)##\(.*\)/`tput setaf 4``tput bold`\1:`tput setaf 5`\2`tput sgr0`\3/p" $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# DOCKER TASKS
build: ## Build the container
	docker build -t $(APP_NAME) .

run: ## Run the container
	docker run --rm -it --name $(APP_NAME) -p 9020:8080 -p 9021:5900 $(APP_NAME)

stop: ## Stop the container
	docker stop $(APP_NAME)