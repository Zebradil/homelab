SERVICE_NAME=netdata

up:
	@echo "Netdata is installed outside docker" && exit 1
	docker stack deploy $(SERVICE_NAME) -c docker-compose.yaml

down:
	docker stack rm $(SERVICE_NAME)
