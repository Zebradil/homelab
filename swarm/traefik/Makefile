SERVICE_NAME=traefik

up:
	docker-machine scp .htpasswd    $(DOCKER_MACHINE_NAME):/var/data/traefik/
	docker-machine scp traefik.toml $(DOCKER_MACHINE_NAME):/var/data/traefik/
	docker-machine scp logrotate    $(DOCKER_MACHINE_NAME):/etc/logrotate.d/traefik
	docker stack deploy $(SERVICE_NAME) -c docker-compose.yaml

down:
	docker stack rm $(SERVICE_NAME)

generate-htpasswd:
	@printf "`read -p 'Username: ' username; echo $${username}`:`openssl passwd -apr1`\n" >> traefik.htpasswd
