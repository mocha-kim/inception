FROM	debian:buster

COPY	./tools/init.sh /tmp/init.sh

RUN		apt-get update -y
RUN		apt-get install -y mariadb-server dumb-init

RUN		chmod 111 /tmp/init.sh

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE	3306

CMD		["bash", "/tmp/init.sh"]