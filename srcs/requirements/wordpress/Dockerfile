FROM	debian:buster

COPY	./tools/init.sh /tmp/init.sh
COPY	./conf/wp-config.php /tmp/wp-config.php
COPY	./conf/www.conf /tmp/www.conf

RUN		mkdir -p /var/www/wordpress

RUN 	apt-get update
RUN 	apt-get install -y php7.3 php-fpm php-cli curl php-mysql mariadb-client dumb-init

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp
RUN		chmod +x /usr/bin/wp

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE	9000

CMD		["bash", "/tmp/init.sh"]