sed -ie "s|DOMAIN_NAME|$DOMAIN_NAME|g" /tmp/default.conf
cp -f /tmp/default.conf /etc/nginx/sites-available/default

nginx -g 'daemon off;'