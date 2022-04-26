#!bin/bash/
mv /tmp/wp-config.php /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress/

sed -i -e "s|DATABASE_NAME|'$DATABASE_NAME'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|DATABASE_USR|'$DATABASE_USR'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|DATABASE_PWD|'$DATABASE_PWD'|g" /var/www/wordpress/wp-config.php

sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf

sed -i "s/.*listen = 127.0.0.1.*/listen = 9000/g" /etc/php7/php-fpm.d/www.conf
# Append Env Variables on the Configuration File
echo "env[DATABASE_HOST] = \$DATABASE_HOST" >> /etc/php7/php-fpm.d/www.conf
echo "env[DATABASE_USR] = \$DATABASE_USR" >> /etc/php7/php-fpm.d/www.conf
echo "env[DATABASE_PWD] = \$DATABASE_PWD" >> /etc/php7/php-fpm.d/www.conf
echo "env[DATABASE_NAME] = \$DATABASE_NAME" >> /etc/php7/php-fpm.d/www.conf
sed -i -e "s|;clear_env = no|clear_env = no|g" /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php/

while ! mariadb -h$DATABASE_HOST -P3306 -u$DATABASE_ROOT -p$DATABASE_ROOT_PWD; do sleep 5; done
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --path=/var/www/wordpress/
wp plugin update --all
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD
wp post create --post_title="inception" --post_content="content" --post_status=publish --post_author="unknown"

exec /usr/sbin/php-fpm7.3