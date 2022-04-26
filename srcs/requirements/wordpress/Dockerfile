FROM	debian:buster

COPY	./tools/init.sh /tmp
COPY	./conf/wp-config.php /tmp

RUN		apt-get update -y
RUN		apt-get install -y php-fpm php-mysql curl dumb-init tar

RUN		echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN		mkdir -p /var/www/wordpress
RUN		curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp
RUN		chmod +x /usr/bin/wp
RUN		wp core download --version=5.8.1 --path=/var/www/wordpress

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE	9000

CMD		["bash", "/tmp/init.sh"]