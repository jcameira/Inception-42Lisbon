all : up

up : 

	@docker compose -f ./srcs/docker-compose.yml up -d

build:

	mkdir -p /home/jcameira/data/mysql
	mkdir -p /home/jcameira/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up --build

down :

	@docker compose -f ./srcs/docker-compose.yml down

stop :

	@docker compose -f ./srcs/docker-compose.yml stop

start :

	@docker compose -f ./srcs/docker-compose.yml start

status :

	@docker compose -f ./srcs/docker-compose.yml ps

clean:

	@docker system prune -a -f

fclean: clean
	@docker volume rm $$(docker volume ls -q)

logs_maria:

	@docker compose logs -f ./srcs/docker-compose.yml mariadb

logs_nginx:

	@docker compose logs -f ./srcs/docker-compose.yml nginx

logs_wordpress:

	@docker compose logs -f ./srcs/docker-compose.yml wordpress

logs_redis:

	@docker compose logs -f ./srcs/docker-compose.yml redis

logs_ftp:

	@docker compose logs -f ./srcs/docker-compose.yml ftp