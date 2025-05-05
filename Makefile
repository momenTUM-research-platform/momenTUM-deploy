# Makefile at the root of momenTUM-deploy/
.PHONY: local vm down logs

PROJECT_NAME := mdeploy

local:
	docker-compose -p $(PROJECT_NAME) \
	  -f deployment/docker-compose.yml \
	  -f deployment/docker-compose.override.yml \
	  up -d --build

vm:
	docker-compose -p $(PROJECT_NAME) \
	  -f deployment/docker-compose.yml \
	  -f deployment/docker-compose.vm.yml \
	  up -d --build

down:
	docker-compose -p $(PROJECT_NAME) \
	  -f deployment/docker-compose.yml down

logs:
	docker-compose -p $(PROJECT_NAME) \
	  -f deployment/docker-compose.yml logs -f