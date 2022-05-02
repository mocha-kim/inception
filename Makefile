NAME = inception

all		: $(NAME)

$(NAME)	:
		sudo mkdir -p "/home/sunhkim/data"
		sudo mkdir -p "/home/sunhkim/data/wordpress" "/home/sunhkim/data/mariadb"
		sudo docker-compose -f ./srcs/docker-compose.yml up --force-recreate --build -d

clean	:
		sudo docker-compose -f ./srcs/docker-compose.yml down -v --rmi all --remove-orphans

fclean	: clean
		sudo rm -rf "/home/data"
		sudo rm -f .setup
		sudo docker system prune --volumes --all --force
		sudo docker network prune --force
		sudo docker volume prune --force

re		: fclean all

up		:
		sudo docker-compose -f srcs/docker-compose.yml up

down	:
		sudo docker-compose -f srcs/docker-compose.yml down

restart	:
		sudo docker-compose -f srcs/docker-compose.yml restart

ps		:
		sudo docker-compose -f srcs/docker-compose.yml ps

.PHONY	: all clean fclean re up down restart ps
