export

STACK_NAME := traefik

up:: render upload
	$(MAKE) -f $(LIB_MK) $@

update:: up update-traefik update-oauth

update-%::
	$(MAKE) -f $(LIB_MK) update SERVICE_NAME=$*

down::
	$(MAKE) -f $(LIB_MK) $@

upload::
	docker-machine scp -d logrotate $(DOCKER_MACHINE_NAME):/etc/logrotate.d/traefik

render::
	envsubst < config/static.yaml.tpl > config/static.yaml
	docoseco < docker-compose.tpl.yaml > docker-compose.yaml

