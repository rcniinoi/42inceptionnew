NAME = inception
DIR_DB = mariadb wordpress

all: $(NAME)

$(NAME): up

up:
	mkdir -p $(DIR_DB)
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

re: clean up

clean: down
	@if [ -z $$(docker image ls -qa) ]; then \
		echo "No images found."; \
	else \
		docker image rm -f $$(docker images -qa); \
	fi
	@if [ -z $$(docker volume ls -q) ]; then \
		echo "No volumes found."; \
	else \
		docker volume rm $$(docker volume ls -q); \
	fi
	sudo rm -rf $(DIR_DB)

fclean: clean
	docker system prune -af
	docker volume prune -f

img :
	docker image ls -a

net :
	docker network ls

ps :
	docker ps -a

.PHONY: all up down re clean fclean img net ps
