sed -i -e "s|localhost|localhost $DOMAIN_NAME|g" /etc/hosts
sed -i -e "s|DOMAIN_NAME|$DOMAIN_NAME|g" /etc/nginx/nginx.conf

nginx -g 'daemon off;'