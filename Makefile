SHELL=/bin/bash
.PHONY: help build up down test

help: ## Show this help
	@echo "Targets:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\):.*##[ \t]*/    \1 ## /' | sort | column -t -s '##'

build: ## Build Nginx container
	docker-compose build

up: ## Start Nginx container
	docker-compose up -d

down: ## Stops Nginx container
	docker-compose down

test: ## Make test request
	curl -X POST -d '{"foo": "bar", "bar": 123}' -H "X-Proxy-Host:httpbin.org" -H "X-Proxy-Proto:https" http://qqq:www@localhost:8080/anything/fizz/buzz?aaa=bbb
