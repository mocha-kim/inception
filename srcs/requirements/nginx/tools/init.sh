echo "127.0.0.1	$DOMAIN_NAME" >> /etc/hosts

nginx -g 'daemon off;'