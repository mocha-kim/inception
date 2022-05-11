#!bin/bash/

wp core download --path=/var/www/wordpress --allow-root

mv /tmp/wp-config.php /var/www/wordpress/wp-config.php
mv /tmp/www.conf /etc/php/7.3/fpm/pool.d/www.conf
chown -R www-data:www-data /var/www/wordpress/

usermod -a -G www-data www-data

sed -ie "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf

sleep 100;
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --path=/var/www/wordpress --allow-root
wp plugin update --all --path=/var/www/wordpress --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --path=/var/www/wordpress --allow-root
wp post create --post_title="inception" --post_content="content" --post_status=publish --post_author=$WP_USR --path=/var/www/wordpress --allow-root

exec /usr/sbin/php-fpm7.3