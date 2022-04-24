NAME = inception

all		: $(NAME)

$(NAME)	:
		sudo mkdir "/home/data/wordpress" "/home/data/mariadb"
		sudo docker-compose -f ./srcs/docker-compose.yml up --force-recreate --build -d

clean	:
		sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans

fclean	: clean
		sudo rm -rf "/home/data/wordpress" "/home/data/mariadb"
		sudo rm -f .setup
		sudo docker system prune --volumes --all --force
		sudo docker network prune --force
		sudo docker volume prune --force

re		: fclean all

up		:
		sudo docker-compose -f ../srcs/docker-compose.yml up

<<<<<<< HEAD
.PHONY	: all clean fclean re ps
=======
down	:
		sudo docker-compose -f srcs/docker-compose.yml down

ps		:
		sudo docker-compose -f srcs/docker-compose.yml ps

.PHONY	: all clean fclean re up down ps
>>>>>>> 44b1c245245ebf0c7213d77d4caa562be725855b
