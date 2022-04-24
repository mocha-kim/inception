#!/bin/sh
chown -R mysql:mysql /var/lib/mysql

# init
service mysql start
echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$DATABASE_USR'@'%' IDENTIFIED BY '$DATABASE_PWD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USR'@'%';" | mysql -u root
service mysql stop

echo "127.0.0.1	$DOMAIN_NAME" >> /etc/hosts
exec /usr/sbin/mysqld -u root