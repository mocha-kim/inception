sed -ie "s|DOMAIN_NAME|$DOMAIN_NAME|g" /etc/nginx/nginx.conf

nginx -g 'daemon off;'