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

up:: up-common up-traefik up-heimdall up-portainer up-grocy up-commento
down:: down-common down-traefik down-heimdall up-portainer down-grocy down-commento

up-commento::
up-common::
up-grocy::
up-heimdall::
up-monitoring::
up-portainer::
up-traefik::
up-%::
	$(MAKE) -C $* up

update-commento::
update-grocy::
update-heimdall::
update-monitoring::
update-portainer::
update-traefik::
update-%::
	$(MAKE) -C $* update

down-commento::
down-common::
down-grocy::
down-heimdall::
down-monitoring::
down-portainer::
down-traefik::
down-%::
	$(MAKE) -C $* down

generate-htpasswd:
	@printf "`read -p 'Username: ' username; echo $${username}`:`openssl passwd -apr1`\n" >> .htpasswd
	@echo Appended new line to .htpasswd

