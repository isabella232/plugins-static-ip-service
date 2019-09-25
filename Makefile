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

sample-call: ## Make sample HTTPbin request
	curl -X POST -d '{"foo": "bar", "bar": 123}' -H "X-Proxy-Authorization: Bearer foobar" -H "X-Proxy-Base-Url:https://httpbin.org" http://qqq:www@localhost:8080/anything/fizz/buzz?aaa=bbb

publish: ## Publish the API Gateway to Docker Cloud
	docker build -t "emarsys/nginx-proxy-poc:$(shell git rev-parse HEAD)" .
	docker push "emarsys/nginx-proxy-poc:$(shell git rev-parse HEAD)"
	docker image rm "emarsys/nginx-proxy-poc:$(shell git rev-parse HEAD)"

up-from-image:
	docker run -d --name nginx-proxy-poc -p '8080:8090' -e 'PROXY_USER=qqq' -e 'PROXY_PASSWORD=www' emarsys/nginx-proxy-poc:$(shell git rev-parse HEAD)
