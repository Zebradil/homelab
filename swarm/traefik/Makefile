export

STACK_NAME := traefik

up:: upload-traefik
	$(MAKE) -f $(LIB_MK) $@

update:: upload-traefik update-traefik update-oauth

update-%::
	$(MAKE) -f $(LIB_MK) update SERVICE_NAME=$*

down::
	$(MAKE) -f $(LIB_MK) $@

upload-traefik:
	envsubst < traefik.yaml.tpl > data/traefik.yaml
	docker-machine scp -r -d data/. $(DOCKER_MACHINE_NAME):$(DOCKER_DATA_DIR)/traefik/
	docker-machine scp -d logrotate $(DOCKER_MACHINE_NAME):/etc/logrotate.d/traefik
