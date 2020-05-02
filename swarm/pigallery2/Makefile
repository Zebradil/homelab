SERVICE_NAME=grocy

up:
	docker stack deploy $(SERVICE_NAME) -c docker-compose.yaml

down:
	docker stack rm $(SERVICE_NAME)
