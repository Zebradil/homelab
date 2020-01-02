SERVICE_NAME=beehive
BEEHIVE_VERSION=0.3.2

build:
	docker build --build-arg BEEHIVE_VERSION=$(BEEHIVE_VERSION) -t zebradil/beehive:$(BEEHIVE_VERSION) .

up:
	docker stack deploy $(SERVICE_NAME) -c docker-compose.yaml

down:
	docker stack rm $(SERVICE_NAME)
