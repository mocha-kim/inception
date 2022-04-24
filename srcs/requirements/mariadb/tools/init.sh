#!/bin/sh
chown -R mysql:mysql /var/lib/mysql

# init
service mysql start
echo "flush privileges;" | mysql -u root

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_ROOT_PWD';" | mysql -u root

echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$DATABASE_USR'@'%' IDENTIFIED BY '$DATABASE_PWD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USR'@'%';" | mysql -u root

echo "flush privileges;"
service mysql stop

exec /usr/sbin/mysqld -u root