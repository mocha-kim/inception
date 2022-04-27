FROM	debian:buster

COPY	./tools/init.sh /tmp/init.sh
COPY	./conf/wp-config.php /tmp/wp-config.php
COPY	./conf/www.conf /tmp/www.conf

RUN		mkdir -p /var/www/wordpress

RUN 	apt-get update
RUN 	apt-get install -y php7.3 php-fpm php-cli wget curl php-mysql php-mbstring php-xml sendmail mariadb-client
RUN		rm -rf /var/lib/apt/lists/*
RUN		mkdir /run/php

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xvzf latest.tar.gz
RUN		rm -rf latest.tar.gz

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE	9000

CMD		["bash", "/tmp/init.sh"]