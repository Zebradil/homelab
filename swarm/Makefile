SHELL = bash
STACK_NAME = a
DOCKER_DATA_DIR = /var/data

include .env
export $(shell sed 's/=.*//' .env)

ifndef DOCKER_NAME
$(error DOCKER_NAME is not defined)
endif

ifndef DOMAIN
$(error DOMAIN is not defined)
endif

ifneq ($(DOCKER_MACHINE_NAME),$(DOCKER_NAME))
$(error check to which docker you are connected)
endif

up:: upload-traefik deploy-all
down:: destroy-all

deploy-all::
	docker stack deploy $(STACK_NAME) -c docker-compose.yaml

destroy-all::
	docker stack rm $(STACK_NAME)

update-%: upload-%
	docker service update --force $(STACK_NAME)_$*

upload-traefik:
	envsubst < traefik/traefik.yaml.tpl > traefik/data/traefik.yaml
	docker-machine scp -r -d traefik/data/. $(DOCKER_MACHINE_NAME):$(DOCKER_DATA_DIR)/traefik/
	docker-machine scp -d traefik/logrotate $(DOCKER_MACHINE_NAME):/etc/logrotate.d/traefik

generate-htpasswd:
	@printf "`read -p 'Username: ' username; echo $${username}`:`openssl passwd -apr1`\n" >> traefik.htpasswd

