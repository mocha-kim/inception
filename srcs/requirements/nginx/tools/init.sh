echo "127.0.0.1	$DOMAIN_NAME" >> /etc/hosts
echo "$DOMAIN_NAME" >> /etc/hostname
sed -i -e "s|DOMAIN_NAME|$DOMAIN_NAME|g" /etc/nginx/nginx.conf

nginx -g 'daemon off;'