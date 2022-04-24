#!bin/bash/
mv wordpress/* /var/www/html/
cat "wordpress files moved"
rm latest.tar.gz
rm -r wordpress

mv /tmp/wp-config.php /var/www/html/
chown -R www-data:www-data /var/www/html/

sed -i -e "s|DATABASE_NAME|'$DATABASE_NAME'|g" /var/www/html/wp-config.php
sed -i -e "s|DATABASE_USR|'$DATABASE_USR'|g" /var/www/html/wp-config.php
sed -i -e "s|DATABASE_PWD|'$DATABASE_PWD'|g" /var/www/html/wp-config.php
sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf
sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf
sed -i -e "s|;clear_env = no|clear_env = no|g" /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php/

exec /usr/sbin/php-fpm7.3