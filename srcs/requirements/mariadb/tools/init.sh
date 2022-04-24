#!/bin/sh
chown -R mysql:mysql /var/lib/mysql

# init
service mysql start
mysql

echo "flush privileges;"

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_ROOT_PWD';"

echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
echo "CREATE USER IF NOT EXISTS '$DATABASE_USR'@'%' IDENTIFIED BY '$DATABASE_PWD';"
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USR'@'%';"

echo "flush privileges;"
service mysql stop

exec /usr/sbin/mysqld -u root