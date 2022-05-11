sed -ie "s|DOMAIN_NAME|$DOMAIN_NAME|g" /tmp/default.conf
mv /tmp/default.conf /etc/nginx/nginx.conf
rm /etc/nginx/sites-enabled/default

nginx -g 'daemon off;'