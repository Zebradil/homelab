COMPOSE_FILE ?= docker-compose.yaml
SERVICE_NAME ?= $(STACK_NAME)

up::
	docker stack deploy $(STACK_NAME) -c $(COMPOSE_FILE)

update::
	docker service update --force $(STACK_NAME)_$(SERVICE_NAME)

down::
	docker stack rm $(STACK_NAME)
