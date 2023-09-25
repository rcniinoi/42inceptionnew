NAME = inception

all: $(NAME)

$(NAME): up

up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

re: fclean
	docker compose -f ./srcs/docker-compose.yml up -d --build

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

fclean: clean
	docker system prune -af
	docker volume prune -f

.PHONY: all up down re clean fclean