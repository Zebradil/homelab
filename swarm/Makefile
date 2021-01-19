include .bootstrap.mk

DOCKER_DATA_DIR ?= /var/data
NET_NAME ?= public-proxy

SHELL := bash
LIB_MK := $(realpath lib.mk)

include .env
export $(shell sed 's/=.*//' .env)

ifndef CLUSTER_ID
$(error CLUSTER_ID is not defined)
endif

ifndef DOMAIN
$(error DOMAIN is not defined)
endif

ifneq ($(shell docker info -f '{{.Swarm.Cluster.ID}}'),$(CLUSTER_ID))
$(error check to which docker swarm cluster you are connected)
endif

## Deploy

up:: ## Deploy ALL THE THINGS!!1
up:: \
     up-common \
     up-commento \
     up-echoserver \
     up-grocy \
     up-heimdall \
     up-portainer \
     up-statping \
     up-traefik \


up-commento:: ## Deploy commento stack
up-common:: ## Deploy common stack
up-echoserver:: ## Deploy echoserver stack
up-grocy:: ## Deploy grocy stack
up-heimdall:: ## Deploy heimdall stack
up-monitoring:: ## Deploy monitoring stack
up-portainer:: ## Deploy portainer stack
up-statping:: ## Deploy statping stack
up-taskd:: ## Deploy taskd stack
up-traefik:: ## Deploy traefik stack
up-%::
	$(MAKE) -C $* up

## Update

update-commento:: ## Update commento stack
update-echoserver:: ## Update echoserver stack
update-grocy:: ## Update grocy stack
update-heimdall:: ## Update heimdall stack
update-monitoring:: ## Update monitoring stack
update-portainer:: ## Update portainer stack
update-statping:: ## Update statping stack
update-taskd:: ## Update taskd stack
update-traefik:: ## Update traefik stack
update-%::
	$(MAKE) -C $* update

## Destroy

down:: ## Destroy ALL THE THINGS!!1
down:: \
     down-common \
     down-commento \
     down-echoserver \
     down-grocy \
     down-heimdall \
     down-portainer \
     down-statping \
     down-traefik \


down-commento:: ## Destroy commento stack
down-common:: ## Destroy common stack
down-echoserver:: ## Destroy echoserver stack
down-grocy:: ## Destroy grocy stack
down-heimdall:: ## Destroy heimdall stack
down-monitoring:: ## Destroy monitoring stack
down-portainer:: ## Destroy portainer stack
down-statping:: ## Destroy statping stack
down-taskd:: ## Destroy taskd stack
down-traefik:: ## Destroy traefik stack
down-%::
	$(MAKE) -C $* down

## Misc

generate-htpasswd:: ## Add new user-pass pair to .htpasswd file
	@printf "`read -p 'Username: ' username; echo $${username}`:`openssl passwd -apr1`\n" >> .htpasswd
	@echo Appended new line to .htpasswd
