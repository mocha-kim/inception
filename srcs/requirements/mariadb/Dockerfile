FROM		debian:buster

COPY		./tools/init.sh /tmp/
COPY		./conf/my.cnf /tmp/

RUN			apt-get update -y
RUN			apt-get install -y mariadb-server mariadb-client dumb-init

RUN			chmod 111 /tmp/init.sh
RUN			mv ./tmp/my.cnf /etc/mysql/my.cnf
RUN			chmod 444 /etc/mysql/my.cnf

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE		3306

CMD			["bash /tmp/init.sh"]