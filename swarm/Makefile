export

DOCKER_DATA_DIR ?= /var/data
NET_NAME ?= public-proxy

SHELL := bash
LIB_MK := $(realpath lib.mk)

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

up:: up-common up-traefik up-heimdall up-portainer
down:: down-common down-traefik down-heimdall up-portainer

up-common::
up-heimdall::
up-portainer::
up-traefik::
up-%::
	$(MAKE) -C $* up

update-heimdall::
update-portainer::
update-traefik::
update-%::
	$(MAKE) -C $* update

down-common::
down-heimdall::
down-portainer::
down-traefik::
down-%::
	$(MAKE) -C $* down

generate-htpasswd:
	@printf "`read -p 'Username: ' username; echo $${username}`:`openssl passwd -apr1`\n" >> .htpasswd
	@echo Appended new line to .htpasswd

