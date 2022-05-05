sed -ie "s|DOMAIN_NAME|$DOMAIN_NAME|g" /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'