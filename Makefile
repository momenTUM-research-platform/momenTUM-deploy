.PHONY: \
	local \
	vm \
	dashboard-local \
	dashboard-vm \
	dashboard-frontend-local \
	dashboard-frontend-vm \
	designer-local \
	designer-vm \
	down \
	logs

PROJECT_NAME := mdeploy

LOCAL_FILES := \
	-f deployment/docker-compose.yml \
	-f deployment/docker-compose.override.yml

VM_FILES := \
	-f deployment/docker-compose.yml \
	-f deployment/docker-compose.vm.yml


local:
	docker compose -p $(PROJECT_NAME) $(LOCAL_FILES) \
		up -d --build


vm:
	docker compose -p $(PROJECT_NAME) $(VM_FILES) \
		up -d --build


dashboard-local:
	docker compose -p $(PROJECT_NAME) $(LOCAL_FILES) \
		up -d --build dashboard-api dashboard-frontend


dashboard-vm:
	docker compose -p $(PROJECT_NAME) $(VM_FILES) \
		up -d --build dashboard-api dashboard-frontend


dashboard-frontend-local:
	docker compose -p $(PROJECT_NAME) $(LOCAL_FILES) \
		up -d --build --no-deps dashboard-frontend


dashboard-frontend-vm:
	docker compose -p $(PROJECT_NAME) $(VM_FILES) \
		up -d --build --no-deps dashboard-frontend


designer-local:
	docker compose -p $(PROJECT_NAME) $(LOCAL_FILES) \
		up -d --build designer-backend designer-frontend


designer-vm:
	docker compose -p $(PROJECT_NAME) $(VM_FILES) \
		up -d --build designer-backend designer-frontend


down:
	docker compose -p $(PROJECT_NAME) $(LOCAL_FILES) \
		down


logs:
	docker compose -p $(PROJECT_NAME) $(LOCAL_FILES) \
		logs -f