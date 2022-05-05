FROM	debian:buster

COPY	./tools/init.sh /tmp/init.sh
COPY	./conf/wp-config.php /tmp/wp-config.php
COPY	./conf/www.conf /tmp/www.conf

RUN		mkdir -p /var/www/wordpress

RUN 	apt-get update
RUN 	apt-get install -y php7.3 php-fpm php-cli wget curl php-mysql php-mbstring php-xml mariadb-client dumb-init
RUN		rm -rf /var/lib/apt/lists/*
RUN		mkdir /run/php
RUN		curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp
RUN		chmod +x /usr/bin/wp

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE	9000

CMD		["bash", "/tmp/init.sh"]