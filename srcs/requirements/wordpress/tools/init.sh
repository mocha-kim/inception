#!bin/bash/
mv wordpress/ /var/www/
rm latest.tar.gz

mv /tmp/wp-config.php /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress/

sed -i -e "s|DATABASE_NAME|'$DATABASE_NAME'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|MYSQL_USER|'$MYSQL_USER'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|MYSQL_PASSWORD|'$MYSQL_PASSWORD'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf
sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf
sed -i -e "s|;clear_env = no|clear_env = no|g" /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php/

exec /usr/sbin/php-fpm7.3