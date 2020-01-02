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

deploy-%:
	$(MAKE) -C $* up

destroy-%:
	$(MAKE) -C $* down

