FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get install -y dumb-init nginx openssl

RUN 	openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=KR/ST=Korea/L=Seoul/O=42school/OU=sunhkim/CN=sunhkim" \
		-keyout /etc/ssl/private/sunhkim.key -out /etc/ssl/certs/sunhkim.crt
      
COPY	./conf/default.conf /tmp/default.conf
COPY	./tools/init.sh /tmp/init.sh

ENTRYPOINT  ["/usr/bin/dumb-init"]

EXPOSE	443

CMD		["bash", "/tmp/init.sh"]