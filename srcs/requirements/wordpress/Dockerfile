FROM	debian:buster

COPY	./tools/init.sh /tmp
COPY	./conf/wp-config.php /tmp
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN		apt-get update -y
RUN		apt-get install -y php-fpm php-mysql wget dumb-init

RUN		mkdir -p /var/www/wordpress

RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN 	chmod +x wp-cli.phar
RUN 	cp wp-cli.phar /usr/bin/wp
RUN		chmod +x /usr/bin/wp

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE	9000

CMD		["bash", "/tmp/init.sh"]