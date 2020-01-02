SERVICE_NAME=portainer

up:
	docker stack deploy $(SERVICE_NAME) -c docker-compose.yaml

down:
	docker stack rm $(SERVICE_NAME)
