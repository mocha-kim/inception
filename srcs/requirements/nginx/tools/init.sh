sed -ie "s|DOMAIN_NAME|$DOMAIN_NAME|g" /tmp/default.conf
cp -f /tmp/default.conf /etc/nginx/nginx.conf
rm -f /etc/nginx/sites-enabled/default

nginx -g 'daemon off;'